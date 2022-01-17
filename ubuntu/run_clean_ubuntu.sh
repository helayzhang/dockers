#!/bin/bash
PWD=$(pwd)
docker run --security-opt seccomp=unconfined -v /Users/helayzhang/codes:/root/codes:delegated --network host --name ubuntu -it ubuntu:20.04 /bin/bash
