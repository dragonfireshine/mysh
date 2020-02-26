#!/usr/bin/bash
factorial(){
factorial=1
#for((i=1;i<=$1;i++))
for i in `seq $1`
do
	#factorial=$[ $factorial * $i ]
	#let factorial=$factorial*$i
	let factorial*=$i
done
echo "$1的阶乘是：$factorial"
}

factorial $1 
factorial $2 
factorial $3 
