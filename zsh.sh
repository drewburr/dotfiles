#!/bin/bash

# Silence zsh warings from Apple
# export BASH_SILENCE_DEPRECATION_WARNING=1

# History configuration
export HISTSIZE=20000
export SAVEHIST=20000

# Remove duplicate entries from history
setopt HIST_IGNORE_ALL_DUPS   # delete older entry when a duplicate is added
setopt HIST_SAVE_NO_DUPS      # don't write duplicates to the history file
setopt HIST_FIND_NO_DUPS      # don't show duplicates when searching
setopt HIST_IGNORE_DUPS       # don't record an entry that matches the previous one
setopt HIST_EXPIRE_DUPS_FIRST # expire duplicates first when trimming history
setopt HIST_REDUCE_BLANKS     # strip superfluous blanks before recording
