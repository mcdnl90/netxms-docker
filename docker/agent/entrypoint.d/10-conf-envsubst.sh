#!/bin/bash

export NX_AGENTD_SYSTEMNAME="${NX_AGENTD_NAME_PREFIX}-${HOSTNAME}"
export CONFIG_VARS="HOSTNAME ${!NX_AGENTD_@}"
export VARS=$(echo ${CONFIG_VARS} | tr ' ' '\n' | sed -e 's!^!\$\{!g' -e 's!$!\}!g')

SELF="\e[34m$(basename $0)\e[0m"

if [ ! -d "/tmp/nxagentd.conf.d" ]
then
    echo -e "${SELF}: \e[33m/tmp/nxagentd.conf.d\e[0m doesnt exist, \e[32mskipping\e[0m... "
    exit 0
fi

if [ ! -d "/etc/nxagentd.conf.d" ]
then
    echo -e "${SELF}: \e[33m/tmp/nxagentd.conf.d\e[0m doesnt exist, \e[32mcreating\e[0m... \e[32m/etc/nxagentd.conf.d\e[0m"
    mkdir -p /etc/nxagentd.conf.d
fi

for FILE in /tmp/nxagentd.conf.d/*.conf
do
    FILENAME=$(basename ${FILE})
    echo -e "${SELF}: performing envsubst on \e[33m${FILENAME}\e[0m"
    cat ${FILE} | envsubst "${VARS}" > /etc/nxagentd.conf.d/$FILENAME
    echo -e "${SELF}:  ... \e[31m${FILE}\e[0m => \e[32m/etc/nxagentd.conf.d/${FILENAME}\e[0m"
done

