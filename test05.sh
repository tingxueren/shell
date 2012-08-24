#!/bin/bash

# FILE必须为文件，不能是文件夹，/shell/* 对/shell错误
for FILE in $HOME/shell/*
do 
	echo $FILE >> a.out
#	echo ${FILE} > b.out
	cp $FILE /tmp
#	FILE=echo `basename ${FILE}`
#	chmod +r /tmp/${FILE}
done	
