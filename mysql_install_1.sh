#!/usr/bin/env bash
#mysql install 1
#by lyh
while read line
do
	{
	#Yum
	ssh root@$ip "rm -rf /etc/yum.repos.d/*"
	ssh root@$ip "wget ftp://172.168.8.100/yumrepo/centos7.repo -P /etc/yum.repos.d"
	ssh root@$ip "wget ftp://172.168.8.100/yumrepo/mysql57.repo -P /etc/yum.repos.d"
	ssh root@$ip "yum -y install lftp vim-enhanced bash-completion"
	#scp -r /etc/yum.repos.d/centos7.repo root@$ip:/etc/yum.repos.d/
	
	#Firewall & SELinux
	ssh root@$ip "systemctl stop firewalld; systemctl disable firewalld"
	ssh root@$ip "setenforce 0; sed -ri '/^SELINUX/c\SELINUX=disabled' /etc/selinux/config"

	#ntp
	ssh root@$ip "yum -y install chrony"
	ssh root@$ip "sed -ri '/3.centos.pool.ntp.org/a\server 172.16.8.100 iburst' /etc/chrony.conf"
	ssh root@$ip "systemctl start chronyd; systemctl enable chronyd"
	
	#install mysql5.7
	ssh root@$ip "yum -y install mysql-community-server"
	ssh root@$ip "systemctl start mysqld; systemctl enable mysqld"
	ssh root@$ip "grep 'temporary password' /var/log/mysqld.log |awk '{print \$NF}' > /root/mysqloldpass.txt"
	ssh root@$ip "mysqladmin -uroot -p'`cat /root/mysqloldpass.txt`' password '123456'"
	}&

done < /root/scripts/ip.txt
wait
echo "all finish..."
