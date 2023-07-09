#!/bin/bash

mkdir /var/www/
mkdir /var/www/html
mkdir /run/php/

cd /var/www/html

# curl (short for "Client URL") is a command line tool that enables data transfer over various network protocols.
# install wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# after donwload wp-cli we should give him all permissions
chmod +x wp-cli.phar

# now we will moves the WP-CLI tool to /usr/local/bin/ directory, for making it available system-wide as the wp command.
mv wp-cli.phar /usr/local/bin/wp

# changes the owner of the /var/www/html/ directory and all its subdirectories to www-data:www-data. www-data is the user and group commonly used by web servers to access files.
chown -R www-data:www-data /var/www/html/

# change the permissions of that directory and their subdirs to make that directories readable, writable, and executable by the owner (www-data) and readable and executable by others.
chomd -R 755 /var/www/html/

# change working direcotry
cd /var/www/html/

# install and configure wordpress
wp core download --allow-root
wp core config  --dbhost = $HOST \
                --dbname = $MYSQL_DATABASE \
                --dbuser = $MYSQL_USER \
                --dbpass = $MYSQL_PASSWORD

chmod 600 wp-config.php

wp core install --url = $URL \
                --title = $TITLE \
                --admin_name = $ADMIN_USER \
                --admin_password = $ADMIN_PASSWORD \
                --admin_email = $ADMIN_EMAIL \

exec "$@"
