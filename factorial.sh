#!/usr/bin/bash
factorial(){
factorial=1
for((i=1;i<=5;i++))
do
	factorial=$[ $factorial * $i ]
done
echo "5的阶乘是：$factorial"
}

factorial
