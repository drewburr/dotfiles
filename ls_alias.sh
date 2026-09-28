#!/bin/bash

# Colorised output (-G is color on BSD/macOS, but "no group" on GNU)
if [[ $OSTYPE == 'darwin'* ]]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
alias ll='ls -l'  # Long output
alias la='ls -la' # Long with all
alias lla='ls -la'
alias ld='ls -ld' # Long and direct
alias lld='ls -ld'
alias lt='ls -lt' # Long and sorted by time
alias ltr='ls -ltr' # Long and sorted by time (reversed)
alias latr='ls -latr' # Long, all, and sorted by time (reversed)
