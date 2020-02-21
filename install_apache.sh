#!/usr/bin/bash
#install apache
#v1.0 by lyh 2020-2-3
#if ! ping -c1 www.baidu.com &>/dev/null;then
ping -c1 www.baidu.com &>/dev/null
if [ $? -ne 0 ];then
	echo "connect: unreachable"
	exit
fi
yum -y install httpd
systemctl start httpd
systemctl enable httpd
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --reload
sed -ri '/^SELINUX=/cSELINUX=disabled' /etc/selinux/config
setenforce 0
