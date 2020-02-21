#!/usr/bin/bash
#yum config case
yum_server=10.18.40.100
os_version=`cat /etc/redhat-release |awk '{print $4}' \
|awk -F"." '{print $1"."$2}'`

[ -d /etc/yum.repos.d ] || mkdir /etc/yum.repos.d/bak &>/dev/null
mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/bak &>/dev/null

case "$os_version" in 
7.6)
	cat >/etc/yum.repos.d/centos7u6.repo <<-EOF
	[centos7u6]
	name=centos7u6
	baseurl=ftp://$yum_server/centos7u3
	gpgcheck=0
	EOF
	echo "7.6 yum configure.."
	;;
6.8)
	curl -o /etc/yum.repos.d/centos6u8.repo ftp:/$yum_server/centos6u8.repo
	;;
5.9)
	curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-5.repo
	;;
*)
	echo "error"
esac
