read -p "请输入一个数值：" num

if [[ ! "$num" =~ ^[0-9]+$ ]];then
	echo "你输入的不是数字，程序退出!!!"
	exit
fi
echo ccc
