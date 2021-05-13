#!/bin/bash

SELF="\e[34m$(basename ${0})\e[0m"

if [ -d "/mnt/extra-mibs"  ] && [ ! -z "$(/bin/ls -A /mnt/extra-mibs)" ]
then
    echo -e "${SELF}: rebuilding mib library... "

    cp -v /mnt/extra-mibs/*.txt /usr/share/netxms/mibs/
    nxmibc -d /usr/share/netxms/mibs -o /usr/share/netxms/mibs/netxms.mib 2>&1 > /tmp/mibs-update.log

    echo -e "\e[32mdone\e[0m"
    echo -e "${SELF}: log can be found on \e[33m/tmp/mibs-update.log\e[0m"
else
    echo -e "${SELF}: no extra mibs found"
fi
