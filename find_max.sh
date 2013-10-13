#!/bin/bash
# find max in ever column

file=$1

for i in  5 6 23 24 32 33;
do
	echo "the $i column max is:"
	#awk -F"," '{printf "%d\n", $i;}'  $file | uniq | sort -r | head -1
	#awk -F","  '{print "'$i'"}' $file |uniq| sort -r -n | head -1
	# awk 中引用 shell 中的变量 i=5, $i -eq 5, "'$i'" -eq 5, print $5 means print $"'$i'"
	# sort -n 代表按照数字进行排列
	awk -F","  '{print $"'$i'"}' $file |uniq| sort -r -n | head -100
	echo "the $i column min is:"
	awk -F","  '{print $"'$i'"}' $file |uniq| sort -n | head -100
	#awk -F","  '{print $5}' $file |uniq| sort -r -n | head -1
done 	

