#!/bin/bash

FILE=$1
if [ -f $FILE ] ; then
	awk  -F: '{ 
		if ( $1 ~ /[Bb]/ ) {
			AMOUNT = $NF
		}		
		if ( $1 ~ /[Mm]/ ) {
			MIN = $NF
		}		
		if ( $1 ~ /[Dd]/) {
			AMOUNT += $NF
			if ( AMOUNT < MIN)
				printf "%s\t%f\t%s\n", $2, AMOUNT, " * Below Min Balance"; 
			else
				printf "%s\t%f\n", $2, AMOUNT; 

		}
		if ( $1 ~ /[Cc]/) {
			AMOUNT -= $NF
			if ( AMOUNT < MIN)
				printf "%s\t%f\t%s\n", $2, AMOUNT, " * Below Min Balance"; 
			else
				printf "%s\t%f\n", $2, AMOUNT; 
		}
		if ( $1 ~ /[Ww]/) {
			AMOUNT -= $NF
			if ( AMOUNT < MIN)
				printf "%s\t%f\t%s\n", $2, AMOUNT, " * Below Min Balance"; 
			else
				printf "%s\t%f\n", $2, AMOUNT; 
		} 	
		

	}

		END { printf "Tottle\t\t%f\n", AMOUNT; }
	' $FILE
else 
	echo "$FILE is not a file, please check."
fi	
