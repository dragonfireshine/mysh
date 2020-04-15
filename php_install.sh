#!/usr/bin/env bash
#php install
#v1.0 by lyh
php_install(){
yum -y install libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel \
libxml2 libxml2-devel libcurl libcurl-devel libxslt-devel openssl-devel
cd $soft_dir
tar xf $php_version
cd ${php_version%.tar.xz}
./configure \
--prefix=$php_prefix \
--with-curl \
--with-freetype-dir \
--with-gd \
--with-gettext \
--with-iconv-dir \
--with-jpeg-dir \
--with-kerberos \
--with-libdir=lib64 \
--with-libxml-dir \
--with-mysql \
--with-mysqli \
--with-openssl \
--with-pcre-regex \
--with-pdo-sqlite \
--with-pear \
--with-png-dir \
--with-xmlrpc \
--with-xsl \
--with-zlib \
--enable-fpm \
--enable-bcmath \
--enable-libxml \
--enable-inline-optimization \
--enable-gd-native-ttf \
--enable-mbregex \
--enable-mbstring \
--enable-opcache \
--enable-pcntl \
--enable-shmop \
--enable-soap \
--enable-sockets \
--enable-sysvsem \
--enable-xml \
--enable-zip
make -j $cpus
make install
cp $php_prefix/etc/php-fpm.conf.default $php_prefix/etc/php-fpm.conf
cp sapi/fpm/init.d.php-fpm /etc/rc.d/init.d/php-fpm
chmod a+x /etc/rc.d/init.d/php-fpm
chkconfig --add php-fpm
chkconfig php-fpm on
service php-fpm
}
