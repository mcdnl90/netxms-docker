#!/bin/bash

if [ ! -f "docker-compose.yml" ]
then
    echo "error: this script should be run in the docker-compose.yml home path"
    exit 1
fi

docker-compose --profile cli run --rm cli

