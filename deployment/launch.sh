#!/bin/bash

ARCH=$1
LIBC=$2
DIR=$(dirname $0)
$DIR/pow
cd $DIR

[ -z "$ARCH" ] && ARCH=x86_64
[ -z "$LIBC" ] && LIBC=$DIR/libs/libc6-amd64_2.27-3ubuntu1_i386.so

#export IFS='\n'
for i in {1..1337}
do
	echo "Go"
	#read a
	#read b
	#read c
	#(stdbuf -o0 echo -n $a; sync; stdbuf -o0 echo -n $b; sync; stdbuf -o0 echo -n $c) | (
	if [ "$ARCH" == "x86_64" ]
	then
		LD_PRELOAD=$LIBC timeout 10 $DIR/baby.$ARCH
	else
		timeout 10 qemu-$ARCH -L /usr/$ARCH-linux-* $DIR/baby.$ARCH
	fi
	#)
done

#script -c $(dirname $0)/baby -q /dev/null
#stdbuf -i 0 -o 0 cat | { $(dirname $0)/baby; kill -9 -$(ps -o pgid= $$ | grep -o '[0-9]*'); }
#stdbuf -i 0 -o 0 cat | ./baby
