#!/bin/bash
PWD=$(pwd)
docker run --memory=4096M --memory-swap=4096M --security-opt seccomp=unconfined -v $PWD/code:/root/code --name ubuntu -it ubuntu:helayzhang bash
