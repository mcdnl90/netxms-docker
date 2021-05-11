#!/bin/bash

echo -e "\e[32mRunning pre-entrypoint scripts...\e[0m\n"
if [[ -d "/entrypoint.d" ]]
then
    /bin/run-parts --verbose --regex '\.sh$' '/entrypoint.d'
fi
echo -e "\e[32mDone running pre-entrypoint scripts.\e[0m\n"

exec "$@"
