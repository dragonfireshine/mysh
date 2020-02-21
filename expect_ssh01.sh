#!/usr/bin/expect
spawn ssh root@192.168.44.135

expect {
	"yes/no" { send "yes\r"; exp_continue }
	"password:" { send "centos\r" };
	}
interact
