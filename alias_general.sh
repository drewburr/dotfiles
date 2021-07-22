#!/bin/bash

alias ldapsearch="ldapsearch -h sunldap.wwt.com -p 389 -D 'cn=Directory Manager' -LLL -b"
alias flushdns="sudo killall -HUP mDNSResponder"
alias dnsflush="flushdns"
