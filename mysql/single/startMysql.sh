#!/bin/bash
PWD=$(pwd)
docker run -d --name mysql -e MYSQL_ROOT_PASSWORD=user@123 -v $PWD:/etc/mysql/conf.d -p 3306:3306 mysql:5.7
