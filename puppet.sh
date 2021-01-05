#!/bin/bash

#For pe-client-tools
PATH=$PATH:/opt/puppetlabs/puppet/bin
PATH=$PATH:/opt/puppetlabs/bin

alias puppet-login='puppet-access login --lifetime 1h'
# alias puppet-code-deploy='puppet-code deploy $ENV --wait'
