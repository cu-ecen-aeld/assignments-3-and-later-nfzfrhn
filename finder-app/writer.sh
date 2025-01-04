#!/bin/sh

writefile=$1
writestr=$2

if [ -z $writefile ] && [ -z $writestr ]
then
	echo "Please specify two arguments"
	exit 1
fi

if [ -n $writefile ] && [ -n $writestr ]
then
	# This will create the folder if it not exist yet
	# dirname will extract the folder path without the file
	mkdir -p "$(dirname "$writefile")"
	echo "$writestr" > "$writefile"
	if [ -e $writefile ]
	then
		# echo "File created succesfully"
		exit 0
	else
		echo "File could not be created"
		exit 1
	fi
fi
