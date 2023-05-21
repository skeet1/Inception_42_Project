FROM debian:buster

# Update package manager and install MariaDB server
RUN apt-get update -y && \
    apt-get install -y mariadb-server

# Configure MariaDB to listen on all network interfaces
RUN sed -i 's/bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# CREATE && CHMOD THE SCRIPT TO CONFIGURE DB
COPY ./tools/script.sh .
RUN chmod +x script.sh

ENTRYPOINT  [ "./script.sh" ] 

# Expose port 3306 to allow external connections
EXPOSE 3306

# Define default command to start MariaDB
CMD ["mysqld"]

