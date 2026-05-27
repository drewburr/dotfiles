#!/bin/bash

ocl() {
  local user
  user="$(whoami)1"
  local keychain_service="ocl"

  # Try to get cached password from macOS Keychain
  local password
  password=$(security find-generic-password -a "$user" -s "$keychain_service" -w 2>/dev/null)

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
  read -rs "new_password?Password for $user: "
  echo

  oc login -u "$user" -p "$new_password" "$@"
  if [[ $? -eq 0 ]]; then
    # Replace cached password only after a successful login with the new one
    security delete-generic-password -a "$user" -s "$keychain_service" &>/dev/null
    security add-generic-password -a "$user" -s "$keychain_service" -w "$new_password"
  else
    return 1
  fi
}
