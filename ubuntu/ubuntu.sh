#!/bin/bash
docker start ubuntu
docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -it ubuntu /bin/zsh
