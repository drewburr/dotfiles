#!/bin/bash
# Sources every file at the root of ./Private/

mkdir -p ~/Source/Private/
for item in $(find ~/Source/Private/ -maxdepth 1 -name "*.sh"); do
	# Ensure path is a file
	if [ -f $item ]; then
		# Ensure file is executable
		chmod +x $item
		# Source the file
		source $item
	fi
done
