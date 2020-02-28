#!/usr/bin/bash
num=(1 2 3)
#echo "${num[@]}"

array(){
	local factorial=1
	#for i in "$@"
	#for i in "$*" #error
	for i in $*
	do
		factorial=$[factorial * $i]
	done
	echo "$factorial"
}

#array ${num[@]}
array ${num[*]}	#数组所有元素的值
