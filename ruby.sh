#!/bin/bash

HOMEBREW_PATH="$(which brew)"

# Required for Jekyll builds
# https://jekyllrb.com/docs/installation/macos/

if [[ -d $(echo $HOMEBREW_PATH | sed 's/\/bin\/brew//')/opt/chruby/share/chruby ]]; then
    # Activating Chruby is expensive. Use wrapper function to only load when needed
    function chruby_enable() {
        echo "Enabling Chruby..."
        source $(echo $HOMEBREW_PATH | sed 's/\/bin\/brew//')/opt/chruby/share/chruby/chruby.sh
        source $(echo $HOMEBREW_PATH | sed 's/\/bin\/brew//')/opt/chruby/share/chruby/auto.sh
        # chruby ruby-3.1.2
        echo "Chruby is ready."
    }
fi
