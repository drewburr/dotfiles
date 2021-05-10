#!/bin/bash
# Sources every file at the root of ./Private/

for item in $(ls ~/Source/Private/*.sh); do
	# Ensure path is a file
	if [ -f $item ]; then
		# Ensure file is executable
		chmod +x $item
		# Source the file
		source $item
	fi
done
