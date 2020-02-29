#!/usr/bin/bash
num=(1 2 3)
num2=(2 3 4)
array(){
	#echo "all parameters: $*"
	#local newarray=(`echo $*`)
	local newarray=($*)
	local i
	for((i=0;i<$#;i++))
	do
		newarray[$i]=$[ ${newarray[$i]} * 5 ]
	done
	echo "${newarray[*]}"
}

result=`array ${num[*]}`
#echo $result
echo ${result[*]}

result=`array ${num2[*]}`
echo ${result[*]}
