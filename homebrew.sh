#!/bin/bash

# Locate Homebrew: /opt/homebrew on Apple Silicon, /usr/local on Intel.
# Exports HOMEBREW_PREFIX for other dotfiles to use.
if [[ -z ${HOMEBREW_PREFIX-} ]]; then
    for brew_bin in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
        if [[ -x $brew_bin ]]; then
            eval "$($brew_bin shellenv)"
            break
        fi
    done
    unset brew_bin
fi
