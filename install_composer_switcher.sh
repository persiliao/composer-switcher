#!/bin/sh

workDirectory=$(dirname "$0")
# shellcheck disable=SC2164
pushd ${workDirectory} > /dev/null
workDirectory=$(pwd)

_installLocal(){
    if [[ -d "${HOME}/bin" ]]; then
        cp "${workDirectory}/composer-switcher.sh" "${HOME}/bin/composer-switcher"
    else
        mkdir "${HOME}/bin"
        cp "${workDirectory}/composer-switcher.sh" "${HOME}/bin/composer-switcher"
    fi
    chmod +x "${HOME}/bin/composer-switcher"
}

if [[ $# -gt 0 ]]; then
    arg="$1"
    if [[ $arg == "-g" ]]; then
        if [[ -d "/usr/local/bin" ]]; then
        cp "${workDirectory}/composer-switcher.sh" "/usr/local/bin/composer-switcher"
        else
            mkdir "/usr/local/bin"
            cp "${workDirectory}/composer-switcher.sh" "/usr/local/bin/composer-switcher"
        fi
        chmod +x "/usr/local/bin/composer-switcher"
    else
        _installLocal
    fi
else
    _installLocal
fi

if [ $? == 0 ]; then
    if [ `uname` == "Darwin" ]; then
        echo "\033[32m🍺 Installed the Composer switcher successfully! Enjoy :-)\033[0m"
    else
        echo -e "\033[32m🍺 Installed the Composer switcher successfully! Enjoy :-)\033[0m"
    fi
fi
