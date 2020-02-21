#!/usr/bin/bash
#v1.0 by lyh
pass=123
if [ $# -eq 0 ];then
	echo "usage:`basename $0` file"
	exit 1
fi

if [ ! -f $1 ];then
	echo "error file"
	exit 2
fi

for user in `cat $1`
do
	id $user &>/del/null
	if [ $? -eq 0 ];then
		echo "user $user already exists"
	else
		useradd $user
		echo "$pass" |passwd --stdin $user &>/dev/null
		if [ $? -eq 0 ];then
			echo "$user is created."			
		fi
	fi	
done
