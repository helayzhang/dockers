#!/bin/bash
PWD=$(pwd)
docker run --memory=4096M --memory-swap=4096M --security-opt seccomp=unconfined -v /Users/helayzhang/codes:/root/codes:delegated --network host --name ubuntu20.04_dev -it ubuntu:20.04 /bin/bash
