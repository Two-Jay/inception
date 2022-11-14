#!bin/bash

mkdir -p /var/www/ && mkdir -p /var/www/wordpress
cd /var/www/wordpress
wp core download --allow-root
cp -rf /tmp/wp-config.php /var/www/wordpress/
chown -R www-data:www-data /var/www/wordpress/
wp core install --allow-root --admin_user=jekim --admin_password=1234 \
    --admin_email=djeeee1272@gmail.com --url=jekim.42.fr --title='테스트'
echo "env[MYSQL_DATABASE] = \$MYSQL_DATABASE" >> /etc/php/7.3/fpm/pool.d/www.conf
echo "env[MYSQL_USER] = \$MYSQL_USER" >> /etc/php/7.3/fpm/pool.d/www.conf
echo "env[MYSQL_PASSWORD] = \$MYSQL_PASSWORD" >> /etc/php/7.3/fpm/pool.d/www.conf
echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /run/php/

exec php-fpm7.3 -F