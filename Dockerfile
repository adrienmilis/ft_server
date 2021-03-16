# Debian buster OS

FROM debian:buster 
# The FROM instruction specifies the Parent Image from which you are building.

### UPDATE apt-get ###

RUN apt-get -y update
        && apt-get install -y wget
        && rm -rf /var/libs/apt/lists/*
## list of packages are downloaded with apt-get update. These can safely be removed. 

### Nginx ###

RUN apt-get -y install nginx --> probablement pas necessaire

### PHP ###

RUN apt-get -y install php-fpm php-mysql
# Nginx doest not contain native PHP processing like some other web servers, so php-fpm is needed. Nginx passes PHP requests to this software for processing
# php-mysql will allow PHP to communicate with our database back-end

### MariaDB ###

RUN apt-get -y install mariadb-server mariadb-client

### Adding files ###

ADD srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php
        && chmod 660 /var/www/html/phpmyadmin/config.inc.php
# phpmyadmin config file with passphrase set up