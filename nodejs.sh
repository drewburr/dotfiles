#/bin/bash

export PATH="/usr/local/opt/node@14/bin:$PATH"
HOMEBREW_PATH="$(command -v brew)"

lazynvm() {
    if typeset -f nvm > /dev/null; then unset -f nvm; fi
    if typeset -f node > /dev/null; then unset -f node; fi
    if typeset -f npm > /dev/null; then unset -f npm; fi
    if typeset -f npx > /dev/null; then unset -f npx; fi
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
}

nvm() {
    lazynvm
    nvm $@
}

node() {
    lazynvm
    node $@
}

npm() {
    lazynvm
    npm $@
}

npx() {
    lazynvm
    npx $@
}

# Display npm prefix asynchronously to avoid blocking shell startup
(
    if [ -s "$HOME/.nvm/nvm.sh" ]; then
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use 2>/dev/null
        if command -v npm &> /dev/null; then
            command npm config get prefix 2>/dev/null
        fi
    fi
) >/dev/null 2>&1 &!
