#!/bin/bash

[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

project_name=$1

if [ "$project_name" = "" ]; then
    echo "[ERROR] No command line input provided. Remember the project's name PLEASE!!"
    exit 0
fi

echo "<VirtualHost *:80>
    ServerAdmin webmaster@dummy-host2.example.com
    DocumentRoot "/srv/http/$project_name/public/"
    ServerName www.$project_name.local
</VirtualHost>" >> /etc/httpd/conf/extra/httpd-vhosts.conf

echo "127.0.0.1    www.$project_name.local" >> /etc/hosts

systemctl restart httpd

echo "vhost was created :-)"
