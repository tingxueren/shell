#!/bin/bash
# get part of kdd

file=$1

for i in $(seq 1 100);
do
	let line=$i*3000
	echo $line
	head -n $line $file|tail -n 3000 > kdd_$line
done	
