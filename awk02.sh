#!/bin/bash

FILE=$1
if [ -f $FILE ] ; then
	awk  -F: '{
		if ( $1 ~ /[Bb]/ ) {
			AMOUNT = $NF
		}		
		if ( $1 ~ /[Dd]/) {
			AMOUNT += $NF
			printf "%s\t%f\n", $2, AMOUNT; 
		}
		if ( $1 ~ /[Cc]/) {
			AMOUNT -= $NF
			printf "%s\t%f\n", $2, AMOUNT; 
		}
		if ( $1 ~ /[Ww]/) {
			AMOUNT -= $NF
			printf "%s\t%f\n", $2, AMOUNT; 
		}		

	}' $FILE
else 
	echo "$FILE is not a file, please check."
fi	
