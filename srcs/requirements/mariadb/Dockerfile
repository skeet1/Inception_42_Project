FROM debian:buster

# Update package manager and install MariaDB server
RUN apt-get update -y && \
    apt-get install -y mariadb-server

# Start MariaDB service
COPY ./tools/script.sh .
RUN chmod +x script.sh
# Create a new database and user with privileges

ENTRYPOINT  [ "./script.sh" ] 

# Expose port 3306 to allow external connections
EXPOSE 3306

# Define default command to start MariaDB
CMD ["mysqld_safe"]

