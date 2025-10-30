#!/bin/bash
# Reload the bash environment, as if we're re-logging
refresh() {
    # Clear every alias
    unalias -a

    # Re-source everything based on current shell
    case "$SHELL" in
        */zsh)
            source ~/.zshrc
            source ~/.zprofile
            ;;
        */bash)
            source ~/.bashrc
            # source ~/.bash_profile
            ;;
        *)
            echo "Unknown shell: $SHELL"
            ;;
    esac
}
