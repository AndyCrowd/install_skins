#!/bin/bash
case "$1" in
	list)
	curl http://drweb.nu/WSZ/list.txt
	;;
	get)
		if [[  ! -z "$2" ]];then
		SkinsToGet=(${@:2});		
		BB=($SkinsToGet)
echo ${#SkinsToGet[@]}
		for I in "${SkinsToGet[@]}";do 
		DName=$(dirname "$I")
		if [[  ! -d "$DName" ]];then mkdir -p "$DName";fi
			DD="http://drweb.nu/WSZ/$I"
			((AA++))
			echo "$I" "    $AA"
			curl http://drweb.nu/WSZ/"$I" > $I
		done	
	fi
	;;
esac
