# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amilis <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/18 18:34:26 by amilis            #+#    #+#              #
#    Updated: 2021/03/18 18:34:28 by amilis           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

LABEL name="amilis" \
        school="19" \
        mail="amilis@student.s19.be"

RUN apt-get -y update \
        && apt-get -y install nginx \
        && apt-get install -y wget \
        && rm -rf /var/libs/apt/lists/*

# ADD nginx config file
RUN rm /etc/nginx/sites-available/default \
        && rm /var/www/html/index.nginx-debian.html
ADD srcs/default_autoindex_on /etc/nginx/sites-available/default

# get PHP
RUN apt-get -y install php php-fpm php-mysql php-xml

# get MariaDB
RUN apt-get -y install mariadb-server mariadb-client

# Create database and user for wordpress
ADD srcs/create_wordpress_db.sql /
RUN /etc/init.d/mysql start \
        && mysql < /create_wordpress_db.sql \
        && rm -rf /create_wordpress_db.sql

# get phpMyAdmin
RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz \
        && mkdir -p /var/www/html/phpmyadmin \
        && tar -xf phpMyAdmin-latest-all-languages.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin \
        && rm -rf phpMyAdmin-latest-all-languages.tar.gz

# Add phpmyadmin config file
ADD srcs/config.inc.php /var/www/html/phpmyadmin/

# change permissions & ownership for phpmyadmin files
RUN chmod 660 /var/www/html/phpmyadmin/config.inc.php
RUN chown -R www-data:www-data /var/www/html/phpmyadmin

# Generate SSL key and certificate
RUN openssl req -x509 -nodes -days 365 -subj "/C=BE/ST=BXL/O=19, Inc./CN=localhost" -addext "subjectAltName=DNS:localhost" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

# Get and install wordpress
RUN wget http://wordpress.org/latest.tar.gz \
        && mkdir /var/www/html/wordpress \
        && tar -xf latest.tar.gz -C /var/www/html/ \
        && rm -rf latest.tar.gz \
        && chown -R www-data:www-data /var/www/html/wordpress \
        && apt-get install -y php-gd php-curl php-ssh2 php-mbstring

# Add wordpress config file
ADD srcs/wp-config.php /var/www/html/wordpress/

# Ports
EXPOSE 80 443
