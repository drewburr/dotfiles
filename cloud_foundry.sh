#!/bin/bash

# Pack CLI bash completion
# https://buildpacks.io/docs/tools/pack/#pack-cli
if [[ ! -z $(which pack) ]]; then
    . $(pack completion)
fi
