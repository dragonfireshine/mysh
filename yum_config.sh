#!/usr/bin/bash
#yum config
yum_server=10.18.40.100
os_version=`cat /etc/redhat-release |awk '{print $4}' \
|awk -F"." '{print $1"."$2}'`

[ -d /etc/yum.repos.d ] || mkdir /etc/yum.repos.d/bak
mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/bak

if [ "$os_version" = "7.3" ];then
	cat >/etc/yum.repos.d/centos7u3.repo <<-EOF
	[centos7u3]
	name=centos7u3
	baseurl=ftp://$yum_server/centos7u3
	gpgcheck=0
	EOF
	echo "7.3 yum configure.."
elif [ "$os_version" = "6.8" ];then
	curl -o /etc/yum.repos.d/centos6u8.repo ftp:/$yum_server/centos6u8.repo
elif [ "$os_version" = "5.9" ];then
	curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-5.repo
else
	echo "error"
fi
