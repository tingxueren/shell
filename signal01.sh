#!/bin/bash

if [ $# -lt 1 ] ; then
	echo "USAGE: `basename $0` command."
	exit 0
fi

Init() {
	printf "INFO: Initializing ... "
	
	# check if the last backgrounded pid is valid, if it is
	# try an kill it

	kill -0 $1 2 > /dev/null;
	if [ $? -eq 0 ] ; then
		kill $! > /dev/null 2>&2
		if [ $? -ne 0 ] ; then
			echo "ERROR: Already running as pid $!. EXiting."
			exit 1
		fi
	fi

	# start a new program in the background

	$PEOG &
	printf "Done.\n"
}

CleanUp() {
	kill -9 $!; exit 2;
}

# main()

trap CleanUp 2 3 15
trap Init 1

PROG=$1
Init

while : ;
do 
	wait $!
	$PEOG &
done	
