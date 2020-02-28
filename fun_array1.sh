#!/usr/bin/bash
num=(1 2 3)
#echo "${num[@]}"

array(){
	local factorial=1
	for i in ${num[*]}
	do
		factorial=$[factorial * $i]
	done
	echo "$factorial"
}

array

