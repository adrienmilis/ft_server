#!/bin/bash

docker build -t ft_server .
docker run -tid --name web_server -p 80:80 -p 443:443 ft_server
docker exec web_server service php7.3-fpm start
docker exec web_server service nginx start
docker exec web_server /etc/init.d/mysql start
