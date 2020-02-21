#!/usr/bin/bash
ip=192.168.44.133
while ping -c1 -W1 $ip &>/dev/null
do
	sleep 1
done
echo "$ip is down!"
