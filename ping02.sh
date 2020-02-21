#!/usr/bin/bash
ip=10.18.42.1
ping -c1 $ip &>/dev/null && echo "$ip is up" || echo "$ip is down!"
