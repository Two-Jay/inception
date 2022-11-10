unzip latest-ko_KR.zip -d /var/www/
chown -R www-data:www-data /var/www/wordpress
rm -rf /var/www/wordpress/wp-config-sample.php
mkdir -p /run/php