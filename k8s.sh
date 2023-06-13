#!/bin/bash

# https://kubernetes.io/docs/tasks/tools/included/optional-kubectl-configs-bash-mac/
# This requires Bash 4.1+, which was installed via Homebrew (MacOS)
# chsh -s /usr/local/Cellar/bash/5.1.8/bin/bash
# OR
# chsh -s /usr/local/bin/bash

if [[ -z $BASH_COMPLETION_COMPAT_DIR ]]; then
    export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
fi
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source <(kubectl completion bash)

# Aliases
alias k='kubectl'
alias kns='kubens'
alias kctx='kubectx'
alias kcd='kubectx; kubens; kls'
alias knodes='k get node -o custom-columns=NAME:.metadata.name,CPU:.status.allocatable.cpu,MEMORY:.status.allocatable.memory,STORAGE:.status.allocatable.ephemeral-storage,Unschedulable:.spec.unschedulable -l=node-role.kubernetes.io/worker=true --sort-by={.metadata.name}'

# Autocompletion for k alias
complete -F __start_kubectl k

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
