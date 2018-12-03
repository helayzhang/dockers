#!/bin/bash
PWD=$(pwd)
docker run --memory=4096M --memory-swap=4096M --security-opt seccomp=unconfined -v /Users/zhanghao/codes:/root/codes:delegated --name ubuntu -it ubuntu:helayzhang_0.1 /bin/zsh
