#!/bin/bash

FILE="$1"
if [ -f $FILE ] ; then
	awk '{
		for (x=1; x<=NF; x+=1) {
			printf "%s\t", $(NF+1-x);
		}
		printf "\n";

	}' $FILE
else
	echo "not file, please check!"
fi	
