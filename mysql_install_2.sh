#!/usr/bin/env bash
#mysql install 2
#by lyh
#推过去，执行
#Yum
rm -rf /etc/yum.repos.d/*
wget ftp://172.168.8.100/yumrepo/centos7.repo -P /etc/yum.repos.d
wget ftp://172.168.8.100/yumrepo/mysql57.repo -P /etc/yum.repos.d
yum -y install lftp vim-enhanced bash-completion
#/etc/yum.repos.d/centos7.repo root@$ip:/etc/yum.repos.d/

#Firewall & SELinux
systemctl stop firewalld; systemctl disable firewalld
setenforce 0; sed -ri '/^SELINUX/c\SELINUX=disabled' /etc/selinux/config

#ntp
yum -y install chrony
sed -ri '/3.centos.pool.ntp.org/a\server 172.16.8.100 iburst' /etc/chrony.conf
systemctl start chronyd; systemctl enable chronyd

#install mysql5.7
yum -y install mysql-community-server
systemctl start mysqld; systemctl enable mysqld
grep 'temporary password' /var/log/mysqld.log |awk '{print $NF}'  /root/mysqloldpass.txt

mysqladmin -uroot -p"`cat /root/mysqloldpass.txt`" password "123456"
