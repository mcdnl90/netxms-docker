#!/bin/bash

if [ "$NO_ENTRYPOINTD" == "1" ]
then
    echo -e "\e[33mSkipping pre-entrypoint scripts...\e[0m"
else
    echo -e "\e[32mRunning pre-entrypoint scripts...\e[0m"
    if [[ -d "/entrypoint.d" ]]
    then
        /bin/run-parts --verbose --regex '\.sh$' '/entrypoint.d'
    fi
    echo -e "\e[32mDone running pre-entrypoint scripts.\e[0m\n"
fi

exec "$@"
