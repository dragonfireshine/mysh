#!/usr/bin/bash
num=(1 2 3)

array(){
	a=555
	local outarray=()
	local j
	for i
	do
		outarray[j++]=$[ $i * 5 ]
	done
	echo "${outarray[*]}"
}

#result=`array ${num[*]}`
#echo ${result[*]}
#echo $a

#result=`array ${num[*]}; echo $a`
#echo ${result[*]}

array ${num[*]}
echo "a: $a"
