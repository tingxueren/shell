#!/bin/sh

ANS=today
echo "ANS is " $ANS

case "$ANS" in
	[Yy]es | [Yy])
		ANS=y;;
	*)
		ANS=n;;
		

esac
echo "ANS is " $ANS


