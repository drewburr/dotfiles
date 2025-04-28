#!/bin/bash
# This sets an alias for every script in $DOTFILES_PATH/Scripts/* based on file name
# The file type suffix is omitted from the alias

for item in $(ls $DOTFILES_PATH/Scripts/*); do
    # Ensure item is a file
    if [ -f $item ]; then
        # Ensure file is executable
        chmod +x $item
    fi
done

# Add scripts to PATH
export PATH="$PATH:$DOTFILES_PATH/Scripts"
