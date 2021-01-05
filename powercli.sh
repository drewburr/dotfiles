#!/bin/bash

local_volume='/Users/browndr/Projects/docker/vmware-powerclicore'
container_volume='/usr/scripts'

# powercli container
alias vmware="
    echo Local files: $local_volume ; \
    echo Container files: $container_volume ; \
    docker run -it --rm --volume $local_volume:$container_volume vmware/powerclicore:latest ; \
    echo '' ;
"
alias powercli='vmware'
