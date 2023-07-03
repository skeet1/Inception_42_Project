#!/bin/bash

echo "Let's create TLS certificate"
openssl req -x509 -nodes -out /etc/nginx/MyCertificate.crt \
    -keyout /etc/nginx/MyKey.key -subj \
    "/C=MA/ST=myState/L=Casablanca/O=myCompany/OU=mySection/CN=mkarim.42.fr"

exec "$@"
