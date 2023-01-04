#!/bin/bash
# Drops you into a docker container with powercli installed.
# This is primairily used to interact with vmware

# powercli container
function vmware() {
    local_volume="$HOME/projects/docker/vmware-powerclicore"
    container_volume="/usr/scripts"

    echo Local files: $local_volume
    echo Container files: $container_volume
    docker run -it --rm --volume $local_volume:$container_volume vmware/powerclicore:latest
    echo ''
}

alias powercli='vmware'
