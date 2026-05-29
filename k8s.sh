#!/bin/bash

# https://kubernetes.io/docs/tasks/tools/included/optional-kubectl-configs-bash-mac/
# This requires Bash 4.1+, which was installed via Homebrew (MacOS)
# chsh -s /usr/local/Cellar/bash/5.1.8/bin/bash
# OR
# chsh -s /usr/local/bin/bash

# Source bash-completion if not already loaded (bash only)
if [[ -n ${BASH_VERSION-} ]] && [[ -z ${BASH_COMPLETION_VERSINFO-} ]]; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /usr/local/etc/profile.d/bash_completion.sh ]; then
        . /usr/local/etc/profile.d/bash_completion.sh
    elif [ -f /etc/profile.d/bash_completion.sh ]; then
        . /etc/profile.d/bash_completion.sh
    fi
fi

# Load bash-completion compat directory for deprecated functions
if [ -d /etc/bash_completion.d ]; then
    for file in /etc/bash_completion.d/*; do
        [ -f "$file" ] && . "$file"
    done
fi

# Set compat dir for macOS compatibility
if [[ -z $BASH_COMPLETION_COMPAT_DIR ]]; then
    export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
fi

# Load kubectl completion using the actual binary (not alias).
# Use the completion script matching the current shell; zsh chokes on the
# bash script (it uses `type -t`, which zsh's `type` doesn't support).
if command -v kubectl &> /dev/null; then
    if [[ -n ${ZSH_VERSION-} ]]; then
        autoload -Uz +X compinit && compinit 2>/dev/null
        autoload -Uz +X bashcompinit && bashcompinit 2>/dev/null
        source <(command kubectl completion zsh)
    else
        source <(command kubectl completion bash)
    fi
fi

# Aliases
alias k='kubectl'
alias kns='kubens'
alias kctx='kubectx'
alias kcd='kubectx; kubens; kls'
alias knodes='k get node -o custom-columns=NAME:.metadata.name,CPU:.status.allocatable.cpu,MEMORY:.status.allocatable.memory,STORAGE:.status.allocatable.ephemeral-storage,Unschedulable:.spec.unschedulable -l=node-role.kubernetes.io/worker=true --sort-by={.metadata.name}'

if command -v kubecolor &> /dev/null; then
    alias kubectl='kubecolor'
    # Also set up completion for kubecolor
    if [[ -n ${ZSH_VERSION-} ]]; then
        compdef kubecolor=kubectl
    else
        complete -o default -F __start_kubectl kubecolor
    fi
fi

# Autocompletion for k alias
# complete -F __start_kubectl k

# Colorization for `kubectl diff`
export KUBECTL_EXTERNAL_DIFF="colordiff -N -u"

# # Configure the KUBECONFIG environment variable
# KUBECONFIGS_PATH="$HOME/.kube/configs"
# BASE_KUBECONFIG_PATH="$HOME/.kube/config"
# KUBECONFIG=""
# if [ -d "$KUBECONFIGS_PATH" ]; then
#     if [ -f "$BASE_KUBECONFIG_PATH" ]; then
#         KUBECONFIG="$BASE_KUBECONFIG_PATH"
#     fi
#     for item in $(ls $KUBECONFIGS_PATH); do
#         KUBECONFIG="$KUBECONFIG:$KUBECONFIGS_PATH/$item"
#     done
#     export KUBECONFIG="$(echo $KUBECONFIG | sed 's/^://')"
# fi
