#!/bin/bash

RESPONSE=

while [ -z "$RESPONSE" ] ;
do
	echo -e "Enter the name of a directory where your files are located:\c"
	read RESPONSE
	if [ ! -d "$RESPONSE" ] ; then
		echo "ERROR: Please enter a directory patename."
		RESPONSE=
	fi
done	
