#!/bin/bash

cat << EOF >> ./setup.sql
CREATE DATABASE IF NOT EXISTS '$WORDPRESS_DB_NAME';Í
CREATE USER IF NOT EXISTS '$WORDPRESS_ADMIN_USER'@'%' IDENTIFIED BY '$WORDPRESS_ADMIN_PASSWORD';
GRANT ALL PRIVILEGES ON '$WORDPRESS_DB_NAME'.* TO '$WORDPRESS_ADMIN_USER'@'%';
FLUSH PRIVILEGES;
EOF

service mysql start;

mysql -e "ALTER USER '$MYSQL_ROOT_USER'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'";
mysql -uroot -p < ./setup.sql;

mysqladmin -u$MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWORD shutdown;

exec mysqld;