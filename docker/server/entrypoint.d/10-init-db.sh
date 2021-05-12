#!/bin/bash

echo -n "database initialization... "

/usr/bin/nxdbmgr -q init tsdb 2>&1 > /tmp/db-init.log

if [ "$?" == "0" ]
then
    echo "done"
else
    echo "not needed"
fi

echo "log can be found on /tmp/db-init.log"
