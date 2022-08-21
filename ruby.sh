#!/bin/bash

# Required for Jekyll builds
# https://jekyllrb.com/docs/installation/macos/
if [[ -d $(brew --prefix)/opt/chruby/share/chruby ]]; then
    source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
    source $(brew --prefix)/opt/chruby/share/chruby/auto.sh
    chruby ruby-3.1.2
fi
