#!/bin/bash

echo "Let's create TLS certificate"
openssl req -new -newkey rsa:4096 -x509 \
    -sha256 -days 365 -nodes -out /etc/nginx/MyCertificate.crt \
    -keyout /etc/nginx/MyKey.key -subj \
    "/C=XX/ST=myState/L=Casablanca/O=myCompany/OU=mySection/CN=localhost"

exec "$@"
