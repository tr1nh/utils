#!/bin/bash

# Install docker and docker-compose from binaries

BASE_URL="https://download.docker.com/linux/static/stable/x86_64"
version=`wget https://download.docker.com/linux/static/stable/x86_64/ -qO - | grep 'docker-\d' | tail -n 1 | grep -o '">\([^<]\+\)'`
version=${version:2}

wget "$BASE_URL/$version" -O - | tar -zx
wget https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-x86_64 -O docker/docker-compose
chmod +x docker/docker-compose
