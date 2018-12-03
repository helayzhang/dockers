#!/bin/bash
docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -it ubuntu /bin/bash
