#!/bin/bash
set -euxo pipefail

apt-get update -y

apt-get install -y \
    docker.io \
    jq \
    curl \
    unzip

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
    -o "awscliv2.zip"

unzip awscliv2.zip

./aws/install

rm -rf aws awscliv2.zip

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
  -e DB_HOST="${db_endpoint}" \
  -e DB_USER="$DB_USER" \
  -e DB_PASSWORD="$DB_PASSWORD" \
  ${docker_image}