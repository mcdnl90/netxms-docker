#!/bin/bash

if [ ! -f "docker-compose.yml" ]
then
    echo "error: this script should be run in the docker-compose.yml home path"
    exit 1
fi

docker attach --sig-proxy=false $(docker-compose ps -q server)

