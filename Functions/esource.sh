#!/bin/bash
# Sources a file to the env, exporting each source to the active env
# https://unix.stackexchange.com/questions/79064/how-to-export-variables-from-a-file/79077

esource() {
    set -a
    source $1
    set +a
}
