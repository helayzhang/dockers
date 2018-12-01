#!/bin/bash
PWD=$(pwd)
docker run -d --name postpresql -e POSTGRES_USER=root -e POSTGRES_PASSWORD=rootpass -p 5432:5432 postgres
# docker run -d --name postpresql -e POSTGRES_USER=root -e POSTGRES_PASSWORD=rootpass -v $PWD:/var/lib/postgresql/data -p 5432:5432 postgres
