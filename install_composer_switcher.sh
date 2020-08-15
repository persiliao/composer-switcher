#!/bin/sh

workDirectory=$(dirname "$0")
# shellcheck disable=SC2164
pushd ${workDirectory} > /dev/null
workDirectory=$(pwd)

cp "${workDirectory}/composer-switcher.sh" "/usr/local/bin/composer-switcher"
chmod +x "/usr/local/bin/composer-switcher"
if [ `uname` == "Darwin" ]; then
    echo "\033[32m🍺 Installed the Composer switcher successfully! Enjoy :-)\033[0m"
else
    echo -e "\033[32m🍺 Installed the Composer switcher successfully! Enjoy :-)\033[0m"
fi
