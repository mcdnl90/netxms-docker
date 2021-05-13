#!/bin/bash

SELF="\e[34m$(basename ${0})\e[0m"

echo -en "${SELF}: database upgrade... "

/usr/bin/nxdbmgr -q upgrade 2>&1 > /tmp/db-upgrade.log

echo -e "\e[32mdone\e[0m"
echo -e "${SELF}: log can be found on \e[33m/tmp/db-upgrade.log\e[0m"
