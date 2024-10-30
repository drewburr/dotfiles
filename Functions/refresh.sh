#!/bin/bash
# Reload the bash environment, as if we're re-logging
refresh() {
    # Clear every alias
    unalias -a

    # Re-source everything
    # source ~/.bashrc
    source ~/.zshrc
    source ~/.zprofile
}
