#!/bin/bash

#AWKSCRIPT='{srand(); print rand()}'

for i in {1..10}
do
	AWKSCRIPT='{srand(); print rand()}'
#	SEED=`srand()`
#	echo "SEED = $SEED"
	echo | awk "$AWKSCRIPT"
done	
