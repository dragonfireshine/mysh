#!/usr/bin/env bash
#init os
init_os(){
#Yum
rm -rf /etc/yum.repos.d/*
wget ftp://172.168.8.100/yumrepo/centos7.repo -P /etc/yum.repos.d
yum -y install lftp vim-enhanced bash-completion

#Firewall & SELinux
#systemctl stop firewalld; systemctl disable firewalld
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --reload
setenforce 0; sed -ri '/^SELINUX/c\SELINUX=disabled' /etc/selinux/config

#ntp
yum -y install chrony
sed -ri '/3.centos.pool.ntp.org/a\server 172.16.8.100 iburst' /etc/chrony.conf
systemctl start chronyd; systemctl enable chronyd
}
