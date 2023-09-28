#!/bin/bash
# https://coderwall.com/p/-k_93g/mac-os-x-valueerror-unknown-locale-utf-8-in-python


if [[ $OSTYPE == 'darwin'* ]]; then
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
fi
