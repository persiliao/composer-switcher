#!/bin/bash
# Creator: Persi Liao
# Email: persiliao@sixsir.com
# Twitter: @PersiLiao
# Homepage: https://www.github.com/persiliao

mirrorArray=("aliyun" "tencent" "sjtug" "cnpkg" "japan" "india" "indonesia" "southafrica" "brazil" "korea" "thailand" "usa")

function displayComposerSwitcherHelp(){
    echo "usage: composer-switcher [ -m | --mirror ] [ -g | --global ] [ -c | --cancel ]"
    echo
    echo "    list            one of:" ${mirrorArray[@]}
    echo "    -s|--show       display composer current mirror "
    echo "    -g|--global     composer global mirror"
    echo "    -m|--mirror     composer switch mirror"
    echo "    -c|--cancel     unset packagist mirror"
    echo
}

mirrorUrlArray=("https://mirrors.aliyun.com/composer/" "https://mirrors.cloud.tencent.com/composer/" 
    "https://packagist.mirrors.sjtug.sjtu.edu.cn" "https://php.cnpkg.org" "https://packagist.jp" "https://packagist.in" "https://packagist.phpindonesia.id" "https://packagist.co.za" "https://packagist.com.br" "https://packagist.kr" "https://packagist.mycools.in.th" "https://packagist-mirror.wmflabs.org")

if [[ -z "$1" ]]; then
    displayComposerSwitcherHelp
    exit
fi

POSITIONAL=()
composerMirror=
composerGlobal=
composerCancel=

while [[ $# -gt 0 ]]; do
    key="$1"
    case "$key" in
        -m|--mirror)
            composerMirror=$2
        ;;
        -g|--global)
            composerGlobal="-g"
        ;;
        -s|--show)
            composerShow=1
        ;;
        -c|--cancel)
            composerCancel=1
        ;;
        *)
        POSITIONAL+=("$1") # save it in an array for later
        ;;
    esac
    shift
done

if [[ -n $composerShow ]]; then
    echo -e "\033[32m"`composer config $composerGlobal repos.packagist.org`"\033[0m\n"
    exit
fi

if [[ -z $composerMirror ]] && [[ -z $composerGlobal ]] && [[ -z $composerCancel ]]; then
    displayComposerSwitcherHelp
    exit
fi

if [[ -n $composerCancel ]]; then
    composer config $composerGlobal --unset repos.packagist
    echo -e "\033[32mComposer third-party mirror source cancelled successfully\033[0m\n"
    exit
fi

if [[ -n $composerMirror ]]; then
    composerMirrorUrl=

    for i in "${!mirrorArray[@]}";   
    do   
        if [[ ${mirrorArray[$i]} == $composerMirror ]]; then
            composerMirrorUrl=${mirrorUrlArray[$i]}
        fi
    done

    if [[ -z $composerMirrorUrl ]]; then
        echo "\033[1;31mComposer Mirror Not Found !\033[0m"
        exit
    else
        composer config $composerGlobal repos.packagist composer $composerMirrorUrl
        if [ $? == 0 ]; then
            echo -e "\033[32mComposer mirror source has been successfully switched to ${composerMirror}, ${composerMirrorUrl}\033[0m\n"
        fi
    fi
fi




