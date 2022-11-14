#!bin/bash

rm -rf latest.tar.gz
mkdir -p /var/www/ && mkdir -p /var/www/wordpress
rsync -a /wordpress/ /var/www/wordpress && rm -rf /wordpress
cp -rf ./tmp/wp-config.php /var/www/wordpress/
chown -R www-data:www-data /var/www/wordpress/

echo "env[WORDPRESS_DB_NAME] = \$WORDPRESS_DB_NAME" >> /etc/php/7.3/fpm/pool.d/www.conf
echo "env[WORDPRESS_USER] = \$WORDPRESS_USER" >> /etc/php/7.3/fpm/pool.d/www.conf
echo "env[WORDPRESS_PASSWORD] = \$WORDPRESS_PASSWORD" >> /etc/php/7.3/fpm/pool.d/www.conf
echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /run/php/

exec php-fpm7.3 -F