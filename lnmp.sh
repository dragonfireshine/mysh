#!/usr/bin/env bash
#lnmp install
#v1.0 by lyh
soft_dir=`pwd`/src
config_dir=`pwd`/config
cpus=`lscpu |awk '/^CPU\(s\)/{print $2}'`

. installrc
. include/init_os.sh
. include/tengine_install.sh
. include/php_install.sh
. include/config.sh

init_os
tengine_install
php_install
config
