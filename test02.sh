#!/bin/bash

x=0
# $x 上要有双引号
while [ "$x" -lt 10 ]
do
	echo $x
	# 此处是`，不是‘
	x=`echo "$x + 1" | bc`
done	

