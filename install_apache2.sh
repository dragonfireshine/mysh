#!/usr/bin/bash
#install apache
#v1.0 by lyh 2020-2-3
gateway=192.168.44.2
ping -c1 www.baidu.com &>/dev/null
if [ $? -eq 0 ];then
	yum -y install httpd
	systemctl start httpd
	systemctl enable httpd
	firewall-cmd --permanent --add-service=http
	firewall-cmd --permanent --add-service=https
	firewall-cmd --reload
	sed -ri '/^SELINUX=/cSELINUX=disabled' /etc/selinux/config
	setenforce 0
	
	curl http://127.0.0.1 &>/dev/null
	if [ $? -eq 0 ];then
		echo "Apache ok..."
	fi
elif ping -c1 $gateway &>/dev/null;then
	echo "check dns..."
else
	echo "check ip address!"
fi
