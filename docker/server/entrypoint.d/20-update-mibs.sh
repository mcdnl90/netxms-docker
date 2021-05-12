#!/bin/bash


if [ -d "/mnt/extra-mibs"  ] && [ ! -z "$(/bin/ls -A /mnt/extra-mibs)" ]
then
    echo "rebuilding mib library... "

    cp -v /mnt/extra-mibs/*.txt /usr/share/netxms/mibs/
    nxmibc -d /usr/share/netxms/mibs -o /usr/share/netxms/mibs/netxms.mib 2>&1 > /tmp/mibs-update.log

    echo "done"
    echo "log can be found on /tmp/mibs-update.log"
else
    echo "no extra mibs found"
fi
