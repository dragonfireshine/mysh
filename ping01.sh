#!/usr/bin/bash
ping -c1 www.qfedu.com &>/dev/null && echo "www.qfedu.com is up" || echo "www.qfedu.com is down!"
/usr/bin/python<<-EOF
print "hello world"
EOF

echo "hello bash"
