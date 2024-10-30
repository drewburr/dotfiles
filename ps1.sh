#!/bin/bash

# # bash
# DEFAULT_PS1="\[\033[01;32m\]\u@localhost\[\033[01;34m\] \W\[\033[00m\] "
# export PS1=$DEFAULT_PS1

# # zsh
# # export PS1="%n@localhost %1~ %# "

# function get_cluster() {
#   kubectl config view | yq '.current-context'
# }


# function get_namespace() {
#   kubectl config view | yq --expression ".contexts[].context | select(.cluster == \"$(get_cluster)\") | .namespace"
# }


# KUBEPS1_PATH="/usr/local/opt/kube-ps1/share/kube-ps1.sh"
# if [[ -f $KUBEPS1_PATH ]]; then
#     export PS1_SUFFIX="\[\033[01;34m\] \W\[\033[00m\] "
#     export KUBE_PS1_CLUSTER_FUNCTION=get_cluster
#     export KUBE_PS1_NAMESPACE_FUNCTION=get_namespace
#     export KUBE_PS1_SUFFIX=")"
#     export KUBE_PS1_SYMBOL_ENABLE="false"
#     source $KUBEPS1_PATH
#     export KUBE_PS1='$(kube_ps1)'$PS1_SUFFIX
#     export PS1=$KUBE_PS1

#     alias kubeoff="kubeoff && export PS1=\"$DEFAULT_PS1\""
#     alias kubeon="kubeon && export PS1=\"$KUBE_PS1\""
#     kubeon
# fi
