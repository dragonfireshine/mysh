#!/usr/bin/bash
factorial(){
factorial=1
for((i=1;i<=$num;i++))
do
	factorial=$[ $factorial * $i ]
done
echo "$num的阶乘是：$factorial"
}

num=5
factorial
