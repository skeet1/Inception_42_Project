#!/bin/bash

# Start the MariaDB service
service mysql start

# Wait for the service to initialize
sleep 5

# Create the database
mysql -e "CREATE DATABASE skeet_db;"

# Create a user and grant privileges
mysql -e "CREATE USER 'skeet'@'%' IDENTIFIED BY 'skeet_pass';"
mysql -e "GRANT ALL PRIVILEGES ON skeet_db.* TO 'skeet'@'%';"
mysql -e "FLUSH PRIVILEGES;"

# Stop the MariaDB service
service mysql stop

# Run the default command (mysqld_safe)
exec "$@"