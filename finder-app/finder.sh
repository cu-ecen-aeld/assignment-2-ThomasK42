#!/bin/sh
# Finder script for assignment 1
# Author: Thomas Kloeker

set -u

if [ $# -ne 2 ]
then
	echo "Expecting 2 arguments, but received $#"
	exit 1
fi
if [ ! -d $1 ]
then
	echo "First argument should be a directory, but is not"
	exit 1
fi

EXISTING_FILE_NUM=$(find $1 -type f | wc -l)
MATCHING_LINE_NUM=$(grep -s -r $2 $1 | wc -l)

echo "The number of files are ${EXISTING_FILE_NUM} and the number of matching lines are ${MATCHING_LINE_NUM}"