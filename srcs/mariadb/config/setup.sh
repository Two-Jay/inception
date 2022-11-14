#!/bin/bash

service mysql start;

cat /var/lib/mysql/.setup 2> /dev/null

if [ $? -ne 0 ]; then
mysql -e "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME";
mysql -e "CREATE USER IF NOT EXISTS '$WORDPRESS_USER'@'%' IDENTIFIED BY '$WORDPRESS_PASSWORD'";
mysql -e "GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_USER'@'%'";
mysql -e "ALTER USER '$MYSQL_ROOT_USER'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
# mysql $WORDPRESS_DB_NAME -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD < ./wp_dump.sql
mysqladmin -u$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD shutdown;
touch /var/lib/mysql/.setup
fi

exec mysqld