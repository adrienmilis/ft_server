# Debian buster OS

FROM debian:buster

### UPDATE apt-get ###

RUN apt-get -y update

### Nginx ###

RUN apt-get -y install nginx

### PHP ###

RUN apt-get -y install php-fpm php-mysql
# Nginx doest not contain native PHP processing like some other web servers, so php-fpm is needed. Nginx passes PHP requests to this software for processing
# php-mysql will allow PHP to communicate with our database back-end

### MariaDB ###

RUN apt-get -y install mariadb-server mariadb-client