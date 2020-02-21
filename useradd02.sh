#!/usr/bin/bash
###############################################
#useradd				      #
#v2.0 by lyh 27/1/2020			      #
###############################################
read -p "Please input number:" num
if [[ ! "$num" =~ ^[0-9]+$ || "$num" =~ ^0+$ ]];then
	echo "error number!"
	exit
fi

read -p "Please input prefix:" prefix
if [ -z "$prefix" ];then
	echo "error prefix"
	exit
fi

for i in `seq $num`
do
	user=$prefix$i
	useradd $user
	echo "123" |passwd --stdin $user  &>/dev/null
	if [ $? -eq 0 ];then
		echo "$user is created."
	fi
done
