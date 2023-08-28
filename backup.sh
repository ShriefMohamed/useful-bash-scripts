#!/bin/bash

[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

#backup_dir=/home/shrief/Downloads/Backup
backup_dir=$1

if [ "$backup_dir" = "" ]; then
    backup_dir=/home/shrief/Downloads/Backup
    echo "[INFO] Backup dir wasn't provided, Default: $backup_dir"
fi

if [ ! -d "$backup_dir" ]; then
    mkdir "$backup_dir"
fi

cp /etc/httpd/conf/httpd.conf "$backup_dir"
cp /etc/httpd/conf/extra/httpd-vhosts.conf "$backup_dir"
cp /etc/hosts "$backup_dir"

mariadb-dump -u root -proot --all-databases > "$backup_dir/alldb.sql"

echo "All done :-)"

