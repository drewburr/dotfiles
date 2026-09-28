#!/bin/bash

if [[ $OSTYPE == 'darwin'* ]]; then
    alias flushdns="sudo killall -HUP mDNSResponder"
else
    alias flushdns="resolvectl flush-caches"
fi
alias dnsflush="flushdns"
