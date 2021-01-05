#!/bin/bash
function kdecode()  {
    if [ -z $1 ]; then
        echo "kdecode will decode secret(s) from a kubernetes namespace."
        echo ""
        echo "Usage:"
        echo "    kdecode namespace [secret_name]"
    elif [ -z $2 ]; then
        kubectl get secrets $1 -o json | jq '.data | map_values(@base64d)'
    else
        kubectl -n $1 get secrets $2 -o json | jq '.data | map_values(@base64d)'
    fi
}
