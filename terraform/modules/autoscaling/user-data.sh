#!/bin/bash
set -euxo pipefail

apt-get update -y

apt-get install -y \
    docker.io \
    awscli \
    curl

systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu

docker pull ${docker_image}

docker run -d \
  --name app \
  --restart unless-stopped \
  -p 3000:3000 \
  ${docker_image}