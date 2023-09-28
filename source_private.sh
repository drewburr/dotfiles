#!/bin/bash
# Sources every file at the root of ./Private/

mkdir -p $DOTFILES_PATH/Private/
for item in $(find $DOTFILES_PATH/Private/ -maxdepth 1 -name "*.sh"); do
	# Ensure path is a file
	if [ -f $item ]; then
		# Ensure file is executable
		chmod +x $item
		# Source the file
		source $item
	fi
done
