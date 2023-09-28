#!/bin/bash
# This sets an alias for every script in $DOTFILES_PATH/Scripts/* based on file name
# The file type suffix is omitted from the alias

for item in $(ls $DOTFILES_PATH/Scripts/*); do
	# Ensure item is a file
	if [ -f $item ]; then
		# Ensure file is executable
		chmod +x $item
		# Strip file type suffix
	cmd=$(echo $item | awk -F '/' '{print $NF}' | sed 's/\..*//g')
		# Set alias
	alias $cmd="$item"
	fi
done
