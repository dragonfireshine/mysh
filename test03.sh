#!/usr/bin/bash
#判断用户输入的是否是数字
read -p "请输入一个数值：" num

while : 
do
	if [[ $num =~ ^[0-9]+$ ]];then
		break
	else
		read -p "不是数字，请重新输入数值：" num
	fi
done

echo "你输入的数字是：$num"
