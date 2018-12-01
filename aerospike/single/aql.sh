#!/bin/bash
docker run -it --name aerospike-tools aerospike/aerospike-tools aql -h $(docker inspect -f '{{.NetworkSettings.IPAddress }}' aerospike)

