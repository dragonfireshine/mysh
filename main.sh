#!/usr/bin/env bash
#main
#推动mysql_install_2.sh的脚本
while read ip
do
	{
	scp -r mysql_install_2.sh root@$ip:/tmp/
	ssh root@$ip "/tmp/mysql_install_2.sh"
	}&
done < ip.txt
wait
echo "all finish...";
