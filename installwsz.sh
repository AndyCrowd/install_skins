#!/bin/bash
#Version 1.0.0-1
#
# License: GPL3
#
# Author: Andy Crowd
# Tested in Arch Linux

SysPath="/usr/share/skins/WSZ"

case "$1" in
        list)
        curl http://drweb.nu/WSZ/list.txt 2> /dev/null
        ;;
        get)
                if [[ "$UID" != 0  ]];then echo 'You must be root!
Skins will be downloaded into '"$SysPath";fi
                if [[  ! -z "$2" ]];then
                SkinsToGet=(${@:2});
echo ${#SkinsToGet[@]}
                for I in "${SkinsToGet[@]}";do
                DName=$(dirname "/${I}")
                if [[  ! -d "${SysPath}/${DName}" ]];then mkdir -p "${SysPath}/${DName}";fi
                  curl http://drweb.nu/WSZ/"$I" > "${SysPath}/${I}"
                done
        fi
        ;;
        set | symset)
        find "${SysPath}"  -iname "*\.wsz" -type f -print | awk '{A=$0;gsub(/[^*]*\//,"",A);system("ln -vs "$0" ./"A) }'
        ;;
        *)
echo 'Warning!!! This script is not realted to AOL/Winamp!
It is just a tool for downloading!

Usage examples:
# Downloading wsz skins with "rock" in their name
install get $(installwsz.sh list | grep -i rock)
# Creating symlinks to skins in the current directory
install set.'
        ;;
esac
