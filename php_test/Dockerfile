FROM debian:buster

RUN apt-get -y update \
        && apt-get -y install nginx

RUN     apt-get -y install php php-fpm php-mysql
#RUN     service php7.3-fpm start

ADD srcs/phpinfo.php /var/www/html/
RUN rm /etc/nginx/sites-available/default
ADD srcs/default /etc/nginx/sites-available
RUN chown -R www-data:www-data /var/www/html