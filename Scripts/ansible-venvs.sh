#!/bin/bash

source ~/.bashrc

ERROR=""

USAGE_MSG="Usage:
ansible-venvs <command> [options]

Commands:
add <version>           Install a new virtual environment.
remove <version>        Remove an existing virtual environment.
reinstall <version>     Full reinstall of an existing venv
help                    Show help.

Note: The version value utilized as 'pip install ansible==<version>' and will determine the name of the virtual enviromnment
"

usage() {
    echo "$ERROR"
    echo "$USAGE_MSG"
}

setup_vars() {
    if [ -z $VERSION ]; then
        echo "Ansible version must be specified."
        exit 1
    fi

    VENV_HOME="$HOME/.ansible/venvs"
    VENV_NAME=ansible$VERSION
    VENV_PATH="$VENV_HOME/$VENV_NAME"
}

add_venv() {
    setup_vars

    # Ensure directory exists
    mkdir -p $VENV_HOME 2> /dev/null

    if [[ -d $VENV_PATH ]]; then
        echo "Virtual environment '$VENV_NAME' already exists."
        exit 0
    fi

    echo "Downloading ansible-$VERSION"

    # Attempt to download the given Ansible version
    python3 -m pip download ansible==$VERSION --no-deps -d /tmp -q 2> /dev/null

    # Fail if invalid version
    if [[ $? -eq 1 ]]; then
        echo "ERROR: Invalid Ansible version ansible-$VERSION"
        exit 1
    fi

    # Create and source the venv
    python3 -m venv $VENV_PATH
    source $VENV_PATH/bin/activate ansible$VERSION

    # Add helpful tip to activate file
    echo "echo \"Run 'deactivate' to exit virtual environment..\"" >> "$VENV_PATH/bin/activate"
    # Update python settings for ansible
    echo "export ANSIBLE_PYTHON_INTERPRETER='$(which python)'" >> "$VENV_PATH/bin/activate"

    # Install Ansible
    pip install ansible==$VERSION

    # Exit venv
    deactivate
}

remove_venv() {
    setup_vars

    if [[ -d $VENV_PATH ]]; then
        setup_vars
        echo "Removing Ansible virtual environment: $VENV_NAME"
        rm -rf "$VENV_PATH"
        refresh  # Reload the bash environment
        echo "Virtual environment has been removed."
    else
        echo "Virtual environment not found.. Nothing to remove."
    fi
}

# Start Script
VERSION=$2

case $1 in
    add )       add_venv
                ;;
    remove )    remove_venv
                ;;
    reinstall ) remove_venv
                add_venv
                ;;
    help | "" ) usage
                ;;
    * )         ERROR="ERROR: unknown argument \"$1\""
                usage
                exit 1
esac

exit 0
