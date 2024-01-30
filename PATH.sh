#!/bin/bash

# Puppet SDK
PATH=$PATH:/opt/puppetlabs/pdk/bin/

# Python
PATH=$PATH:$HOME/Library/Python/3.7/bin:$HOME/Library/Python/3.8/bin:$HOME/Library/Python/3.9/bin
PATH=$PATH:$HOME/Library/Python/3.10/bin:$HOME/Library/Python/3.11/bin

# Oracle Instant Client
PATH=$PATH:$HOME/Library/instantclient_19_3

# libpq (psql)
PATH=$PATH:/usr/local/opt/libpq/bin

# coreutils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
