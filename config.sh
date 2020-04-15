#!/usr/bin/env bash
#config
config(){
#tengine
\cp $config_dir/nginx.conf $nginx_prefix/conf/nginx.conf
\cp $config_dir/index.php $nginx_prefix/html/index.php

$nginx_prefix/sbin/nginx
/etc/init.d/php-fpm restart
}
