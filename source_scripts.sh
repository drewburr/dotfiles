#!/bin/bash
# This sets an alias for every script in $DOTFILES_PATH/Scripts/* based on file name
# The file type suffix is omitted from the alias

for item in $(ls $DOTFILES_PATH/Scripts/* | xargs -n1 basename); do
	# Ensure item is a file
	if [ -f $item ]; then
		# Ensure file is executable
		chmod +x $item
		# Strip file type suffix
		cmd=${var%\.*}
		# Set alias
		echo $cmd
		alias $cmd="$item"
	fi
done
