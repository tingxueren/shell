#!/bin/bash

x=0
while [ "$x" -lt 10 ]
do
#	echo -e "$x \c"
	y=0
	while [ "$y" -le "$x" ] ; do
		echo -e "$y \c"
		y=$(($y+1))
	done
	x=$(($x+1))
	echo
done	
		
