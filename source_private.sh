#!/bin/bash
# Sources every file at the root of ./Private/

priv_path='~/Source/Private'

# If path exists
if [ -d $priv_path ]; then
	for item in $(ls $priv_path/\*.sh); do
		# Ensure path is a file
		if [ -f $item ]; then
			# Ensure file is executable
			chmod +x $item
			# Source the file
			source $item
		fi
	done
fi
