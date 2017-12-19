#!/usr/bin/env bash

echo "### stop and remove all running containers"
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)

# Run docker containers

# https://portainer.io/install.html
echo "#### Portainer.io"
docker volume create portainer_data
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

