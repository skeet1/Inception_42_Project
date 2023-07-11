#!/bin/bash

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
chmod -R 755 /var/www/html/

# change working direcotry
cd /var/www/html/

# install and configure wordpress
wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i '36 s/\/run\/php\/php7.3-fpm.sock/9000/' /etc/php/7.3/fpm/pool.d/www.conf

Set The Database that will be connected with wordpress
sed -i 's/database_name_here/'$MYSQL_DATABASE'/g' /var/www/html/wp-config.php

# Set the Username of The database
sed -i 's/username_here/'$MYSQL_USER'/g' /var/www/html/wp-config.php

# Set the Password
sed -i 's/password_here/'$MYSQL_PASSWORD'/g' /var/www/html/wp-config.php

# set The Hostname of the That base
# sed -i 's/localhost/'$HOST'/g' /var/www/html/wp-config.php
sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', '$HOST' );/g" /var/www/html/wp-config.php


chmod 600 wp-config.php

wp core install --url=$URL \
                --title=$TITLE \
                --admin_name=$ADMIN_USER \
                --admin_password=$ADMIN_PASSWORD \
                --admin_email=$ADMIN_EMAIL \
                --allow-root \

php-fpm7.3 -F
