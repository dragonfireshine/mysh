#!/usr/bin/bash
#ping02 multi thread
#v1.0 by lyh
thread=5
tmp_fifofile=/tmp/$$.fifo

mkfifo $tmp_fifofile
exec 8<> $tmp_fifofile
rm $tmp_fifofile

#for i in {1..$thread}这种写法错误，{}不接受变量
for i in `seq $thread`
do
	echo >&8
done


for i in {1..254}
do
	read -u 8 #读描述符8
	{
	ip=192.168.44.$i
	ping -c1 -W1 $ip &>/dev/null
	if [ $? -eq 0 ];then
		echo "$ip is up."
	else
		echo "$ip is down."
	fi
	echo >&8	
	}&
done
exec 8>&-

wait
echo "all finish..."
