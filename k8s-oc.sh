#!/bin/bash

# Password cache helpers: macOS Keychain, or libsecret (secret-tool) on Linux
_ocl_secret_get() {
  if command -v security &>/dev/null; then
    security find-generic-password -a "$1" -s "$2" -w 2>/dev/null
  elif command -v secret-tool &>/dev/null; then
    secret-tool lookup service "$2" account "$1" 2>/dev/null
  fi
}

_ocl_secret_set() {
  if command -v security &>/dev/null; then
    security delete-generic-password -a "$1" -s "$2" &>/dev/null
    security add-generic-password -a "$1" -s "$2" -w "$3"
  elif command -v secret-tool &>/dev/null; then
    printf '%s' "$3" | secret-tool store --label="$2 ($1)" service "$2" account "$1"
  fi
}

ocl() {
  local user
  user="$(whoami)1"
  local keychain_service="ocl"

  # Determine the requested server from args (first URL-looking argument)
  local requested_server
  local arg
  for arg in "$@"; do
    if [[ "$arg" == http://* || "$arg" == https://* ]]; then
      requested_server="$arg"
      break
    fi
  done

  # If already logged in as the expected user, nothing to do.
  # When a server was requested, only skip if it matches the current one.
  if [[ "$(oc whoami 2>/dev/null)" == "$user" ]]; then
    local current_server
    current_server=$(oc whoami --show-server 2>/dev/null)
    if [[ -z "$requested_server" || "$current_server" == "$requested_server" ]]; then
      echo "Already logged in to ${current_server:-cluster} as $user"
      return 0
    fi
  fi

  # Try to get cached password from macOS Keychain / libsecret
  local password
  password=$(_ocl_secret_get "$user" "$keychain_service")

  if [[ -n "$password" ]]; then
    # Attempt login with cached password
    oc login -u "$user" -p "$password" "$@"
    if [[ $? -eq 0 ]]; then
      return 0
    fi
  fi

  # Resolve cluster URL from args or current kubeconfig
  local server
  server=$(oc config view --minify --output 'jsonpath={.clusters[0].cluster.server}' 2>/dev/null)
  echo "Authentication required for ${server:-unknown server}"

  # Prompt for password
  local new_password
  if [[ -n ${ZSH_VERSION-} ]]; then
    read -rs "new_password?Password for $user: "
  else
    read -rsp "Password for $user: " new_password
  fi
  echo

  oc login -u "$user" -p "$new_password" "$@"
  if [[ $? -eq 0 ]]; then
    # Replace cached password only after a successful login with the new one
    _ocl_secret_set "$user" "$keychain_service" "$new_password"
  else
    return 1
  fi
}
