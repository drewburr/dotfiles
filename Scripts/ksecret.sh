#!/bin/bash

# Generate a yaml-formatted secret
# alias ksecret="kubectl create secret --dry-run=client -o yaml"

# ksecret

args=""
path=""
name=""
cmd="kubectl create secret generic --dry-run=client -o yaml"
encrypt=""

function usage() {
        echo "ksecret can be used to create a generic secret."
        echo ""
        echo "Usage:"
        echo "    ksecret secret_name -f ./id_rsa -l key=value"
        echo ""
        echo "Options:"
        echo "    -f, --file '': File to insert in secret"
        echo "    -l, --literal '': Key and literal value to insert in secret"
        echo "    -p, --path '': Path to store the generated secret"
        echo "    -e, --encrypt: Secret will be encrypted after being created. Requires -p"
}

function check_path() {
    if [[ -d $1 ]]; then
        if [ -z $path ]; then
            path=$1
        else
            echo "Invalid argument. Path may only be given once: $1"
            exit 1
        fi
    else
        echo "Invalid path specified: $1"
        exit 1
    fi
}

function check_name() {
    if [ -z $name ]; then
        name=$1
    else
        echo "Invalid argument. Name may only be given once: $1"
        exit 1
    fi
}

# Handle input
while [ "$1" != "" ]; do
    case $1 in
        -f | --file )           shift
                                args=$args" --from-file=$1"
                                ;;
        -l | --literal )        shift
                                args=$args" --from-literal=$1"
                                ;;
        -p | --path )           shift
                                check_path $1
                                ;;
        -e | --encrypt )        encrypt=1
                                ;;
        -h | --help )           usage
                                exit 0
                                ;;
        * )                     args=$args" $1"
                                check_name $1
                                #usage
                                #exit 1
    esac
    shift
done

# If -e is specified, ensure -p is specified
if [[ $encrypt ]]; then
    echo "Encrypt is true: $encrypt"
    if [[ -z $path ]]; then
        echo "--encrypt requires --path to be specified."
        exit 1
    fi
fi

# Handle if no args were given
if [[ -z $args ]]; then
    usage
else
    # If no path, push  unsealed secret to stdout
    if [[ -z $path ]]; then
        $cmd $args
    else
        # If path is given, create unsealed secret
        $cmd $args > $path/$name-unsealed.yaml
        # If encrypt is given, seal and delete the unsealed secret
        if [[ $encrypt ]]; then
            kubeseal --controller-namespace=sealed-secrets --controller-name=sealed-secrets --format yaml < $path/$name-unsealed.yaml > $path/$name-sealed.yaml
            rm $path/$name-unsealed.yaml
        fi
    fi
fi
