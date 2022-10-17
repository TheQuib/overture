#!/bin/bash

# Prepares and runs from provided configuration files
# Requires:
#  - Docker Engine with Compose plugin
#  - docker-compose.yml
#  - .env
#  - redis.conf

# Prepare Docker
docker volume create storage-data
docker volume create db-data
docker volume create redis-data
docker network create outline-net

# Prepare and migrate database
docker compose run --rm outline yarn db:create --env=production-ssl-disabled
docker compose run --rm outline yarn db:migrate --env=production-ssl-disabled

# Run stack
docker compose up -d