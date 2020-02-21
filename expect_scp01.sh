#!/usr/bin/expect
set ip [lindex $argv 0]
set user [lindex $argv 1]
set password centos
set timeout 5

spawn scp -r /etc/hosts $user@$ip:/tmp

expect {
	"yes/no" { send "yes\r"; exp_continue }
	"password:" { send "$password\r" };
	}
expect eof

