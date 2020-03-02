#!/usr/bin/bash
for i in {A..D}
do
	echo -n "$i"
	for j in {1..9}
	do
		if [ $j -eq 5 ];then
			exit	
		fi
		echo -n "$j"
	done
	echo 
done
