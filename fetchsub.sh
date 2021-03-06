#!/bin/sh
# Author: RA <ravageralpha@gmail.com>

USAGE(){
	echo "Usage:$(basename $0) [eng] files..."
}

[ $# -eq 0 ] && USAGE && exit 0

ERROR(){
	echo "Error:$@" >&2
	exit 1
}

[ -z `which openssl` ] || MD5='openssl md5'
[ -z `which md5` ] || MD5='md5'
[ -z `which md5sum` ] || MD5='md5sum'
[ -z "$MD5" ] && ERROR "No MD5 tools"
[ -z `which curl` ] && ERROR "No curl"
[ -z `which dd` ] && ERROR "No dd :)"
[ -z `which hexdump` ] && ERROR "No hexdump tools"
[ -z `which gunzip` ] && ERROR "No gunzip tools"

USERAGENT="SPlayer Build 1543"
LANGUAGE='chn'
TIMEOUT=5
CRAP="blueray|bluray|blu\-ray|remux|dvdrip|xvid|cd[0-9]|dts|vc1|vc\-1|hdtv|1080p|720p|1080i|x264|limited|ac3|hddvd|repack|@|dts\-hd"
CRAP_MISC="\[|\]|\.|\-|\#|\_|\=|\+|\<|\>|\,"

case `uname` in
	'Linux')
		SED_OPTS='-r -e';;
	'Darwin')
		# Mac Default , if you using GNU sed,edit it
		SED_OPTS='-E -e';;
	*)
		ERROR "unknown OS";;
esac

getFileSize(){
	# Fix Me
	ls -nl "$1" | awk '{print $5}'
}

getFileHash(){
	dd if="$file" bs=1 count=4096 skip=$1 2> /dev/null | $MD5 | head -c32
}

stripFileName(){
	echo -e "$(sed $SED_OPTS "s/"$CRAP"//g" -e "s/"$CRAP_MISC"/ /g")"
}

while [ -n "$1" ];do

	[ "$1" = '--help' ] && USAGE && exit 0

	if [ "$1" = 'eng' ]; then
		LANGUAGE='eng'
		shift
	fi

	file="$1"
	[ ! -f "$file" ] && {
		echo "Cannot locate the target" >&2
		shift
		continue
	}

	filesize=$(getFileSize "$file")

	[ $filesize -le 8192 ] && ERROR "Serious?"

	filepath="E:\\$(dirname "$file" | sed 's/\//\\\\/g')" # it's just work
	filename="$(echo "$(dirname "$file")/$(basename "$file")" | sed 's/\.[^\.]*$//')"
	moviename="$(basename "$filename" | tr [A-Z] [a-z] | stripFileName | xargs)"

	bin="${filename}.bin"

	first=4096
	second=$(($filesize/3*2))
	third=$(($filesize/3))
	fourth=$(($filesize-8192))

	filehash="$(getFileHash $first);$(getFileHash $second);$(getFileHash $third);$(getFileHash $fourth)"

	for i in $(seq 9)
	do
		SERVER="http://splayer$i.shooter.cn/api/subapi.php"

		echo -n "Sending request to $SERVER..."
		
		#send request
		curl -s --connect-timeout $TIMEOUT -A "$USERAGENT" \
		-F "pathinfo=$filepath" -F "filehash=$filehash" -F "shortname=$moviename" -F "lang=$LANGUAGE" \
		-o "$bin" "$SERVER"

		if [ $? -eq 0 ]; then
			# sometimes shooter.cn give zero fuck about your request , so try other
			if [ $(getFileSize "$bin") -le 1024 ]; then
				echo -n -e "Bad response\n" >&2
				rm "$bin"
				FLAG="FAIL"
				sleep 2
				continue
			else
				echo -n -e "OK,Extracting\n"
				FLAG="DONE"
			fi
		else
			echo -n -e "Fail\n" >&2
			FLAG="FAIL"
			sleep 2
			continue
		fi
		
		# get the subtitle filetype
		extname=`dd if="$bin" bs=1 count=7 skip=18 2> /dev/null | sed 's/^.*\(...\)/\1/'`
		sub="$filename.$extname"

		# get the subtitle
		dd if="$bin" of="$sub" bs=1 skip=29 2> /dev/null
		rm "$bin"

		# maybe not handle well , fix me
		gzip=`dd if="$sub" bs=1 count=2 2> /dev/null | hexdump -x | awk '{print $2}'`
		[ "$gzip" = '1f8b' ] && {
			echo "Got gzip here,unzipping..."
			mv "$sub" "${sub}.tgz"
			gunzip -c "${sub}.tgz" > "$sub"
			rm "${sub}.tgz"
		}
		echo "Got subtitle:[$(basename "$1")]"
		break
	done
	[ "$FLAG" = "FAIL" ] && echo "Cannot find the subtitle:[$(basename "$1")]" >&2
	shift
done
