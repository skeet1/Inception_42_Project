#!/bin/bash

echo "Let's create TLS certificate"
# these lines will explain to you all arguments needed for openssl
#   req hiya li kadir create and processing les certificate request
#   -x509 type of certif
#   now if we run the openssl will request for password but -nodes flag prevent that and make the request continue without a password
#   -out where crt and key should be
#   -subj for all other needed informations
openssl req -x509 -nodes -out /etc/nginx/MyCertificate.crt \
    -keyout /etc/nginx/MyKey.key -subj \
    "/C=MA/ST=myState/L=Casablanca/O=myCompany/OU=mySection/CN=mkarim.42.fr"

exec "$@"
