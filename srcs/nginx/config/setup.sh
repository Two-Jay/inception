
# create a self-signed certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

# create a Diffie-Hellman group
openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
