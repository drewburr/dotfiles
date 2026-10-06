#!/bin/bash

# Homebrew's openssl@3 is keg-only (macOS ships LibreSSL), so expose it
# explicitly for the shell and for compilers/pkg-config.
OPENSSL_PREFIX="$HOMEBREW_PREFIX/opt/openssl@3"
if [[ $OSTYPE == 'darwin'* ]] && [ -d "$OPENSSL_PREFIX" ]; then
    export PATH="$OPENSSL_PREFIX/bin:$PATH"
    export LDFLAGS="-L$OPENSSL_PREFIX/lib"
    export CPPFLAGS="-I$OPENSSL_PREFIX/include"
    export PKG_CONFIG_PATH="$OPENSSL_PREFIX/lib/pkgconfig"
fi
unset OPENSSL_PREFIX
