#!/bin/bash

# Needed when Windows hosts paths are being ignored
# Default (enabled) causes bash completion performance concerns
if [[ $(grep -i Microsoft /proc/version) ]]; then
    # echo "Bash is running on WSL"
    alias code='/mnt/c/Users/drewb/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code'
    alias explorer.exe='/mnt/c/Windows/explorer.exe'
fi
