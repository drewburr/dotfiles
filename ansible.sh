#!/bin/bash

#### Ansible venvs ####

mkdir -p ~/.ansible/venvs
for item in $(ls $HOME/.ansible/venvs); do
	# Setup CMD
    venv_path="$HOME/.ansible/venvs/$item/bin/activate"
    # Set alias
	alias $item="source $venv_path"
done

#### Variables needed for Ansible ####

# Required for fork() calls
# https://github.com/ansible/ansible/issues/32499
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Don't use the included python
export ANSIBLE_PYTHON_INTERPRETER="/usr/local/bin/python"
