#!/usr/bin/bash
num=(1 2 3)

array(){
	local i
	local outarray=()
	#for i in $*
	for i
	do
		outarray[j++]=$[ $i * 5 ]
	done
	echo "${outarray[*]}"
}

result=`array ${num[*]}`
echo ${result[*]}

#函数接收位置参数 $1 $2 $3 ... $n
#函数接受数组变量 $* 或 $@
#函数将接受到的所有参数赋值给数组 newarrray=($*)
