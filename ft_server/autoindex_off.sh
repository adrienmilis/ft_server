#!/bin/bash

docker exec web_server rm -rf /etc/nginx/sites-available/default
docker cp srcs/default_autoindex_off web_server:/etc/nginx/sites-available/default
docker exec web_server service nginx restart
