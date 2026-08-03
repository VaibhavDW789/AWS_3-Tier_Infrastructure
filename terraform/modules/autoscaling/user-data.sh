#!/bin/bash
set -euxo pipefail

apt-get update -y

apt-get install -y \
    docker.io \
    jq \
    curl

systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu

SECRET=$(aws secretsmanager get-secret-value \
    --secret-id "${secret_arn}" \
    --query SecretString \
    --output text)

DB_USER=$(echo "$SECRET" | jq -r '.username')

DB_PASSWORD=$(echo "$SECRET" | jq -r '.password')

docker pull ${docker_image}

docker run -d \
  --name app \
  --restart unless-stopped \
  -p 3000:80 \
  ${docker_image}