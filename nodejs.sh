#/bin/bash

export PATH="/usr/local/opt/node@14/bin:$PATH"
HOMEBREW_PATH="$(which brew)"

# nvm setup, reccommended by homebrew
if [[ -d $(echo $HOMEBREW_PATH | sed 's/\/bin\/brew//')/opt/nvm/ ]]; then
    # Activating NVM is expensive. Use wrapper function to only load when needed
    function nvm_enable() {
        echo "Enabling NVM..."
        export NVM_DIR="$HOME/.nvm"
        [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"                                       # This loads nvm
        [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
        echo "NVM is ready."
    }
fi
