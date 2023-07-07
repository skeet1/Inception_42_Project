#!/bin/bash

sed -i 's/bind-address            = 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS SKEET_DB;"
mysql -e "CREATE USER 'skeet'@'%' IDENTIFIED BY 'skeet_pass';"
mysql -e "GRANT ALL PRIVILEGES ON skeet_db.* TO 'skeet'@'%';"
mysql -e "FLUSH PRIVILEGES;"

service mysql stop

mysqld