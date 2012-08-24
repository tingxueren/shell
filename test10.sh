#!/bin/bash

if [ $# -lt 2 ] ; then
	echo "ERROR: Insufficient arguments.";
	exit 1;
fi

case "$1" in
	-o) : # convert the number stored in "$2" into octal
		printf "%o\n" "$2" ;;
	-x) : # convert the number stored in "$2" into hexadecimal
		printf "%x\n" "$2" ;;
	-e) : # convert the number stored in "$2" into scientific
		printf "%e\n" "$2" ;;
		
	*) : # 不能跟在冒号后面直接写，应该换行
		echo "ERROR: Unknown conversion, $1!" ;;
esac	

