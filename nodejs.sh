#/bin/bash

export PATH="/usr/local/opt/node@14/bin:$PATH"

# nvm setup, reccommended by homebrew
if [[ ! -z $(which brew) ]]; then
    if [[ -d $(brew --prefix)/opt/nvm/ ]]; then
        export NVM_DIR="$HOME/.nvm"
        [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"                                       # This loads nvm
        [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
    fi
fi
