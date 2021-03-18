#!/bin/bash

docker exec web_server rm -rf /etc/nginx/sites-available/default
docker cp srcs/default_autoindex_on web_server:/etc/nginx/sites-available/default
docker exec web_server service nginx restart
