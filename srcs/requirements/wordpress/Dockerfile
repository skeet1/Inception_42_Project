# Use the Debian Buster base image
FROM debian:buster

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
        php7.3-fpm \
        php7.3-mysql \
        php7.3-curl \

# Set the working directory
WORKDIR /var/www/html

# Download and extract WordPress
RUN wget -O wordpress.zip https://wordpress.org/latest.zip && \
    unzip wordpress.zip && \
    rm wordpress.zip && \
    mv wordpress /var/www/html/

# Configure PHP-FPM
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.3/fpm/php.ini

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm7.3", "-F"]
