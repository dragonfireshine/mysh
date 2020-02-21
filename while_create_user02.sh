#!/usr/bin/bash
#while create user
#v1.0 by lyh
while read line
do	
	if [ ${#line} -eq 0 ];then
		echo "------------------------"
		continue
	fi
	user=`echo $line |awk '{print $1}'`
	pass=`echo $line |awk '{print $2}'`
	id $user &>/dev/nul
	if [ $? -eq 0 ];then
		echo "user $user already exists"
	else
		useradd $user
		echo "$pass" |passwd --stdin $user &>/dev/null
		if [ $? -eq 0 ];then
			echo "$user is created."
		fi
	fi
done < $1
