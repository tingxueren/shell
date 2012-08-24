#!/bin/bash

# FILE必须为文件，不能是文件夹，/shell/* 对/shell错误
for FILE in $HOME/shell/*
do 
	echo $FILE >> a.out
#	echo ${FILE} > b.out
	cp $FILE /tmp
	# 此处比较巧妙，``是在里面运行代码，“”是结果
	FILE="`basename ${FILE}`"
	chmod +r /tmp/${FILE}
done	

echo "I am ok" > result.txt
