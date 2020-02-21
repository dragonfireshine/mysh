#!/usr/bin/bash
#v1.0 by lyh
while :
do
	read -p "Please enter prefix & pass & num[lyh 123 5]:" prefix pass num
	printf "user information:
	--------------------------------
	user prefix: $prefix
	user password: $pass
	user number: $num
	--------------------------------
	"
	read -p "Are you sure?[y/n]:" action
	if [ "$action" = "y" ];then
		break
	fi
done

for i in `seq -w $num`
do
	user=$prefix$i
	id $user &>/dev/null
	if [ $? -eq 0 ];then
		echo "user $user alrealy exists"
	else
		useradd $user
		echo "$pass" |passwd --stdin $user &>/dev/null
		if [ $? -eq 0 ];then
			echo "$user is created."
		fi
	fi
done



