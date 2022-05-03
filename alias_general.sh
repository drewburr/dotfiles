#!/bin/bash

alias flushdns="sudo killall -HUP mDNSResponder"
alias dnsflush="flushdns"
alias dotenv="export $(grep -v '^#' .env | xargs)"
