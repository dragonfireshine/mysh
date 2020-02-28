#!/usr/bin/bash
#for i in $*
for i in $@
do
	let sum+=$i
done
echo $sum
