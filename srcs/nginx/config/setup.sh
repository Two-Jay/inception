#!/bin/bash

openssl genrsa -out server.key 4096
openssl req -new -key server.key -subj "/C=KR/ST=Seoul/O=42seoul/OU=gam/CN=inception" -out server.csr
openssl req -x509 -days 365 -in server.csr -key server.key -out server.crt

chmod 666 server.crt server.key

mv server.crt /etc/ssl/certs
mv server.key /etc/ssl/private

nginx -g daemon off;