#!/bin/bash

# https://kubernetes.io/docs/tasks/tools/included/optional-kubectl-configs-bash-mac/
# This requires Bash 4.1+, which was installed via Homebrew (MacOS)
# chsh -s /usr/local/Cellar/bash/5.1.8/bin/bash
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source <(kubectl completion bash)

# Aliases
alias k='kubectl'
