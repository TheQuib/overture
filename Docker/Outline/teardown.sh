#!/bin/bash

# Prepares and runs from provided configuration files
# Requires:
#  - Docker Engine with Compose plugin
#  - docker-compose.yml
#  - .env
#  - redis.conf

# Delete stack
docker compose down

# Remove docker volumes and network
docker volume rm storage-data
docker volume rm db-data
docker volume rm redis-data
docker network rm outline-net