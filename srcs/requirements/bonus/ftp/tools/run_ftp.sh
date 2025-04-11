#!/bin/bash

mkdir -p /var/www/html
mkdir -p /var/run/vsftpd/empty

adduser $FTP_USER --disabled-password
echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null

usermod -aG www-data $FTP_USER
chown -R www-data:www-data /var/www/html
chmod -R 775 /var/www/html

exec /usr/sbin/vsftpd /etc/vsftpd.conf
