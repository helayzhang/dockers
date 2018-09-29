#!/bin/bash
docker run -d -e MYSQL_ROOT_PASSWORD=123456 --name mysql-slaver -v /Users/helayzhang/Codes/docker/mysql/slaver:/etc/mysql/conf.d -p 3309:3306 mysql:5.7
#docker run -d -e MYSQL_ROOT_PASSWORD=123456 --name mysql-master -p 3308:3306 mysql:5.7
