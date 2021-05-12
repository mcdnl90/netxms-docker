#!/bin/bash

echo -n "database initialization..."

/usr/bin/nxdbmgr -q check-data-tables #2>&1 > /dev/null

if [ "$?" == "5" ]
then
    /usr/bin/nxdbmgr -q init tsdb #2>&1 > /dev/null
    echo "done"
else
    echo "not needed"
fi

#echo "database upgrade: "
#/usr/bin/nxdbmgr upgrade

