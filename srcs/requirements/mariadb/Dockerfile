FROM debian:buster

# Update package manager and install MariaDB server
RUN apt-get update -y && \
    apt-get install -y mariadb-server

# Configure MariaDB to listen on all network interfaces
RUN sed -i 's/bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# Start MariaDB service
COPY ./tools/script.sh /tmp/script.sh
RUN chmod +x /tmp/script.sh
# Create a new database and user with privileges

ENTRYPOINT ["bash", "/tmp/script.sh"]


# Expose port 3306 to allow external connections
EXPOSE 3306

# Define default command to start MariaDB
CMD ["mysqld_safe"]

