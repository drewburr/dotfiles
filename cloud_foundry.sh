#!/bin/bash

# Pack CLI bash completion
# https://buildpacks.io/docs/tools/pack/#pack-cli
if [[ ! -z $(command -v pack) ]]; then
    function pack_completion() {
        . $(pack completion)
    }
fi
