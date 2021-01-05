#!/bin/bash

function ksealr()  {
    if [ -z $1 ]; then
        echo "ksealr will recursively seal all unsealed secrets under the specified directory."
        echo ""
        echo "ksealr"
        echo "Unsealed secrets are expected to end with '-unsealed.yaml', and will automatically be deleted."
        echo ""
        echo "Usage:"
        echo "    ksealr ./secrets"
    else
        unsealed_files="$(find $1 -type f -name '*-unsealed.yaml')"
        for unsealed_file in $unsealed_files; do
            sealed_file=$(echo $unsealed_file | sed 's/-unsealed.yaml$/-sealed.yaml/')
            kubeseal --controller-namespace=sealed-secrets --controller-name=sealed-secrets --format yaml < $unsealed_file > $sealed_file
            rm $unsealed_file
            echo $sealed_file
        done
    fi
}
