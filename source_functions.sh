#!/bin/bash
# This sources every file in ~/Source/Functions/*

for item in $(ls $DOTFILES_PATH/Functions/*); do
    # Ensure item is a file
    if [ -f $item ]; then
        # Ensure file is executable
        chmod +x $item
        # Source the item
        source $item
	fi
done
