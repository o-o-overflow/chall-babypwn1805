#!/bin/bash

PER_CONNECTION_RARE_LIBC=$1
DIR=$(dirname $0)
cd $DIR

if [ -z "$PER_CONNECTION_RARE_LIBC" ]
then
	PER_CONNECTION_RARE_LIBC=$DIR/libs/$(ls $DIR/libs | sort -R | head -n1)
fi

for i in {1..1337}
do
	echo "Go"
	LD_PRELOAD=$PER_CONNECTION_RARE_LIBC $DIR/baby 2>&1
done
