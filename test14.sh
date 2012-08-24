#!/bin/bash

for i in $@
do 
	if [ -f $i ] ; then
		echo -e "$i\c"
#		awk '/^ *$/ { x=x+1; print x;}' $i > out.$$
#		tail -1 out.$$
#		rm out.$$
		awk '
			/^ *$/ { x+= 1; }
			END { printf " %s\n", x}
		' "$i"

	else
		echo "ERROR: $i not a file." >&2
	fi
done	

