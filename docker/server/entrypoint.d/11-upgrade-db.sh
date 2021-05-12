#!/bin/bash

echo -n "database upgrade... "

/usr/bin/nxdbmgr -q upgrade 2>&1 > /tmp/db-upgrade.log

echo "done"
echo "log can be found on /tmp/db-upgrade.log"
