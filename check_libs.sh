#!/bin/bash

for LIB in $(file libs/* | grep x86-64 | sed -e "s/:.*//")
do
	timeout 1 env LD_PRELOAD=$LIB ./baby.x86_64 2>/dev/null
	[ $? -eq 124 ] && echo GOOD: $LIB || echo BAD: $LIB
done 2>&1 | grep GOOD
