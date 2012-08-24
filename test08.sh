#!/bin/bash

echo -e "File Name\tTyep "

for i in *;
do
echo -e "$i\t\c"
if [ -d $i ]; then
	echo "directory"
elif [ -h $i ]; then
	echo "symbolic link"
elif [ -f $i ]; then
	echo "file"
else
	echo "unknow"
fi
done
