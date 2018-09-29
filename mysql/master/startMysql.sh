#!/bin/bash
docker run -d -e MYSQL_ROOT_PASSWORD=123456 --name mysql-master -v /Users/helayzhang/Codes/docker/mysql/master:/etc/mysql/conf.d -p 3308:3306 mysql:5.7
#docker run -d -e MYSQL_ROOT_PASSWORD=123456 --name mysql-master -p 3308:3306 mysql:5.7
