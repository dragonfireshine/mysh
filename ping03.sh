#!/usr/bin/bash
ip=10.18.42.1
if ping -c1 $ip &>/dev/null; then
	echo "$ip is up."
else
	echo "$ip is down."
fi 
