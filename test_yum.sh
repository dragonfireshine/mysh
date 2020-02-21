#!/usr/bin/bash
#if [ $UID -eq 0 ];then
#if [ $USER = "root" ];then
if [ $USER == "root" ];then
	echo "你有权限,不让你装"
	exit
fi
yum -y install httpd
