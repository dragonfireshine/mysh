#!/usr/bin/bash
ip=192.168.44.141

ping -c1 $ip &>/dev/null
if [ $? -eq 0 ]; then
	echo "$ip is up."
else
	echo "$ip is down."
fi 
