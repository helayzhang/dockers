#!/bin/bash
docker run -d --name aerospike -v ~/codes/docker/aerospike/data:/opt/aerospike/data -p 3000:3000 -p 3001:3001 -p 3002:3002 -p 3003:3003 aerospike/aerospike-server
