#/bin/bash

HOMEBREW_PATH="$(command -v brew)"

# nvm.sh lives in ~/.nvm for a standard install, or in Homebrew's prefix
export NVM_DIR=~/.nvm
NVM_SCRIPT="$NVM_DIR/nvm.sh"
if [ ! -s "$NVM_SCRIPT" ] && [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ]; then
    NVM_SCRIPT="$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
fi

lazynvm() {
    if typeset -f nvm > /dev/null; then unset -f nvm; fi
    if typeset -f node > /dev/null; then unset -f node; fi
    if typeset -f npm > /dev/null; then unset -f npm; fi
    if typeset -f npx > /dev/null; then unset -f npx; fi
    [ -s "$NVM_SCRIPT" ] && . "$NVM_SCRIPT"  # This loads nvm
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
    if [ -s "$NVM_SCRIPT" ]; then
        . "$NVM_SCRIPT" --no-use 2>/dev/null
        if command -v npm &> /dev/null; then
            command npm config get prefix 2>/dev/null
        fi
    fi
) >/dev/null 2>&1 &!
