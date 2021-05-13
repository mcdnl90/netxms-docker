#!/bin/bash

CONFIG_VARS="HOSTNAME ${!NX_AGENTD_@}"
VARS=$(echo ${CONFIG_VARS} | tr ' ' '\n' | sed -e 's!^!\$\{!g' -e 's!$!\}!g')

# init SystemName property to ${NX_AGENTD_NAME_PREFIX}-$(uuidgen | head -c 8)

NX_AGENTD_NAME_PREFIX="${NX_AGENTD_NAME_PREFIX}-$(uuidgen | head -c 8)

if [ ! -d "/etc/nxagentd.conf.d" ]
then
    echo "nxagentd.conf.d doesnt exist, creating..."
    mkdir -v /etc/nxagentd.conf.d
fi

for FILE in /tmp/nxagentd.conf.d/*.conf
do
    echo "performing envsubst on ${FILE}"
    cat ${FILE} | envsubst "${VARS}" > /etc/netxmsd.conf.d/${FILE}
done

echo "cleaning up /tmp/nxagentd.conf.d"

rm -rf /tmp/nxagentd.conf.d
