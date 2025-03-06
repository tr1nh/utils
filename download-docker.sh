#!/bin/bash

# Install docker and docker-compose from binaries

BASE_URL="https://download.docker.com/linux/static/stable/x86_64"
version=`wget $BASE_URL -qO - | grep 'docker-[0-9]\+' | tail -n 1 | grep -o '">\([^<]\+\)'`
version=${version:2}

wget "$BASE_URL/$version" -O - | tar -zx
wget https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -O docker/docker-compose
chmod +x docker/docker-compose
