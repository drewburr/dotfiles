#!/bin/bash

# Opens a shell session in a K8s object

namespace=""
workload=""
cmd="/bin/sh"

function usage() {
        echo "kexec can be used to execute a command into a kubernetes workload."
        echo ""
        echo "Usage:"
        echo "    kexec <workload>"
        echo "    kexec -n namespace-name <workload>"
        echo ""
        echo "Options:"
        echo "    -n, --namespace '': Namespace to apply to secret."
        echo "    -c, --command '': Command to execute inside workload. Default: /bin/sh"
}

function set_workload_name() {
    if [ -z $name ]; then
        workload=$1
    else
        echo "Invalid argument. Workload may only be given once: $1"
        exit 1
    fi
}

# Handle input
while [ "$1" != "" ]; do
    case $1 in
        -n | --namespace )      shift
                                namespace="--namespace $1"
                                ;;
        -c | --command )        shift
                                cmd="$1"
                                ;;
        -h | --help )           usage
                                exit 0
                                ;;
        * )                     set_workload_name $1
    esac
    shift
done

# Handle if no workload name was given
if [[ -z $workload ]]; then
    usage
else
    kubectl $namespace exec -it $workload -- $cmd
fi
