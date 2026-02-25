#!/bin/sh
# Writer script for assignment 1
# Author: Thomas Kloeker

set -u

if [ $# -ne 2 ]
then
	echo "Expecting 2 arguments, but received $#"
	exit 1
fi

DIR=$(dirname $1)

if [ ! -d $DIR ]
then
	mkdir -p $DIR
fi

echo $2 > $1

if [ $? -ne 0 ]
then
	echo "Failed to write to file $1"
	exit 1
fi
