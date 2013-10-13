#!/bin/bash
# clean kdd data

for i in $(seq 1 100);
do 
	let line=$i*3000
	echo $line
	input=kdd_$line
	echo $input
	output=${input}_clean
	echo $output
	awk -F',' '{print $2=""; print $3=""; print $4=""; print $42=""; print $0}' $input | sed '/^$/d' > $output
done	
