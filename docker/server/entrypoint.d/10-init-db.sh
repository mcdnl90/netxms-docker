#!/bin/bash

SELF="\e[34m$(basename ${0})\e[0m"

echo -en "${SELF}: database initialization... "

/usr/bin/nxdbmgr -q init tsdb 2>&1 > /tmp/db-init.log

if [ "$?" == "0" ]
then
    echo -e "\e[32mdone\e[0m"
else
    echo -e "\e[33mnot needed\e[0m"
fi

echo -e "${SELF}: log can be found on /tmp/db-init.log"
