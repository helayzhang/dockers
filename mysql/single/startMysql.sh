#!/bin/bash
docker run -d -e MYSQL_ROOT_PASSWORD=user@123 --name mysql -v /Users/helayzhang/Codes/docker/mysql/single:/etc/mysql/conf.d -p 3306:3306 mysql:5.7
