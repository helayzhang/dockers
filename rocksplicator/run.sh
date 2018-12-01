#!/bin/bash
SRC=/Users/zhanghao/Codes/projects/rocksplicator
DOCKER_ROOT=/Users/zhanghao/codes/docker/rocksplicator/root
docker run --memory=2048M --memory-swap=4096M --security-opt seccomp=unconfined -p 11000:11000 -p 9092:9092 -p 2181:2181 -p 8080:8080 -p 8081:8081 -p 8082:8082 -v $SRC:/rocksplicator -v $DOCKER_ROOT:/root -ti pinterestbo/rocksplicator-build:latest bash
