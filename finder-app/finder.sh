#!/bin/sh
# Author: Nafiz Farhan Bin Zainurin

filesdir=$1
searchstr=$2

if [ -z "$filesdir" -a -z "$searchstr" ]
then
	echo "There were no input given"
	exit 1
elif [ ! -d "$filesdir" ] && [ -n "$filesdir" ]
then 
	echo "Directory does not exist"
	exit 1
else
	# echo "Good Job"
	# Count the number of files in the current and subdirectories
	numFiles=$(find "$filesdir" -type f | wc -l)

	# Count the number of line when specific strings were searched
	numSearch=$(grep -r "$searchstr" "$filesdir" | wc -l)

	echo "The number of files are $numFiles and the number of matching lines are $numSearch"
	exit 0
fi

