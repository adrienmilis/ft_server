#!/bin/bash

docker build -t php_test .
docker run -tid --name php -p 80:80 php_test
docker exec php service php7.3-fpm start
docker exec php service nginx start