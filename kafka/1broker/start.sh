#!/bin/bash
MY_LOCAL_IP=`ifconfig | grep inet | grep broadcast | awk '{print $2}'`
sed -i '.bak' "s/KAFKA_ADVERTISED_HOST_NAME: .*/KAFKA_ADVERTISED_HOST_NAME: $MY_LOCAL_IP/g" docker-compose.yml
mv docker-compose.yml.bak .docker-compose.yml.bak
docker-compose up -d
