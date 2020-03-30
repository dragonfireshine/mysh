#!/usr/bin/bash
ip_list="192.168.44.135 192.168.44.144 192.168.44.147 192.168.44.140"
for ip in $ip_list
do
	for count in {1..3}
	do
		ping -c1 -W1 $ip &>/dev/null
		if [ $? -eq 0 ];then
			echo "$ip ping is ok"
			break
		else
			
			echo "$ip ping is failure: $count"
			fail_count[$count]=$ip
		fi
	done
	if [ ${#fail_count[*]} -eq 3 ];then
		echo "${fail_count[1]} ping is failure!"
		unset fail_count[*]
	fi
done
