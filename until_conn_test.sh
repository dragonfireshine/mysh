#!/usr/bin/bash
#v1.0 by lyh
ip=192.168.44.133
until ping -c1 -W1 $ip &>/dev/null
do
	sleep 1
done
echo "$ip is up"
