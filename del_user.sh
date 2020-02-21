#!/usr/bin/bash
#delete user
#v1.0 by lyh 2020-1-30
read -p "Please input a username: " user

id $user &>/dev/null
if [ $? -ne 0 ];then
	echo "no such user: $user"
	exit 1
fi

read -p "Are you sure?[y/n]: " action
case "$action" in
y|Y|YES|yes)
	userdel -r $user
	echo "$user is deleted!"
	;;
*)
	echo "error"
esac
#if [ "$action" = "y" -o "$action" = "Y" -o "$action" = "YES" -o "$action" = "yes" ];then
#	userdel -r $user
#	echo "$user is deleted!"
#fi

