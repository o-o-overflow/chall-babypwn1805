#!/bin/bash

mkfifo /tmp/f

for LIB in $(file libs/* | grep x86-64 | sed -e "s/:.*//")
do
	#timeout 1 strace -E LD_PRELOAD=$LIB ./baby.x86_64 2>&1 | grep si_signo && echo -n BAD || echo -n GOOD
	timeout 2 cat /tmp/f | timeout 1 strace -E LD_PRELOAD=$LIB ./baby 2>&1 | grep -q detached && echo -n GOOD || echo -n BAD
	echo ": $LIB"
	#[ $? -eq 124 ] && echo GOOD: $LIB || echo BAD: $LIB
done #2>&1 | grep GOOD
