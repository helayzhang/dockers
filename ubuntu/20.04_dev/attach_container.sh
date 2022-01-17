#!/bin/bash
docker start ubuntu20.04_dev
docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -it ubuntu20.04_dev /bin/zsh
