FROM debian:buster

RUN apt-get -y update \
        && apt-get -y install nginx \
        && apt-get install -y wget \
        && rm -rf /var/libs/apt/lists/*

# PHP
RUN     apt-get -y install php php-fpm php-mysql php-xml
#RUN     service php7.3-fpm start

# MariaDB
RUN apt-get -y install mariadb-server mariadb-client

# phpMyAdmin
RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
RUN mkdir -p /var/www/html/phpmyadmin 
RUN tar -xf phpMyAdmin-latest-all-languages.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin
RUN rm -rf phpMyAdmin-latest-all-languages.tar.gz

# PHP test file
ADD srcs/phpinfo.php /var/www/html/

# ADD nginx config file
RUN rm /etc/nginx/sites-available/default
ADD srcs/default /etc/nginx/sites-available
# RUN chown -R www-data:www-data /var/www/html (fonctionne sans a priori)

# Add phpmyadmin config file
ADD srcs/config.inc.php /var/www/html/phpmyadmin/

# change permissions & ownership for phpmyadmin files
RUN chmod 660 /var/www/html/phpmyadmin/config.inc.php
RUN chown -R www-data:www-data /var/www/html/phpmyadmin