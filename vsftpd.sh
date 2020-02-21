#!/usr/bin/bash
systemctl status vsftpd &>/dev/null
if [ $? -eq 0 ];then
	vsftpd_port=
	vsftpd_addr=
	echo "vsftpd is runing"
else
	echo "no running..."
fi
