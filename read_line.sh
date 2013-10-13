#!/bin/bash
# 读入两个文件，逐行读入，并交替打印出来

testfile1=$1
x1=`wc -l $testfile1 |awk '{print $1}'`
testfile2=$2
x2=`wc -l $testfile2 |awk '{print $1}'`

if [ $x1 -le $x2 ]; then
	x=$x1
elif [ $x2 -lt $x1 ]; then
	x=$x2
fi

i=1
while [ $i -le $x ]
do
    echo "`head -$i  $testfile1 | tail -1`"
    echo "`head -$i  $testfile2 | tail -1`"
    i=`expr $i + 1`
done

if [ $x1 -gt $x2 ]; then
	i=`expr $x2 + 1`
	while [ $i -le $x1 ]
	do
	    echo "`head -$i  $testfile1 | tail -1`"
	    i=`expr $i + 1`
	done
fi

if [ $x2 -gt $x1 ]; then
	i=`expr $x1 + 1`
	while [ $i -le $x2 ]
	do
	    echo "`head -$i  $testfile2 | tail -1`"
	    i=`expr $i + 1`
	done
fi
