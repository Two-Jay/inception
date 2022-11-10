openssl genrsa -out server.key 4096;
sleep 5
openssl req -new -key server.key -subj "/C=KR/ST=Seoul/O=42seoul/OU=gam/CN=inception" -out server.csr;
sleep 5
openssl req -x509 -days 365 -in server.csr -key server.key -out server.crt;
sleep 3

chmod 666 server.crt server.key;

mkdir -p /etc/ssl/certs;
mkdir -p /etc/ssl/private;

mv server.crt /etc/ssl/certs;
mv server.key /etc/ssl/private;

