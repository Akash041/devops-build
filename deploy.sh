#!/bin/bash
set -e

BRANCH_NAME=${BRANCH_NAME:-dev}

if [ "$BRANCH_NAME" = "main" ]; then
    IMAGE="akashadmin07/react-app-prod:latest"
else
    IMAGE="akashadmin07/react-app-dev:latest"
fi

echo "Using image: $IMAGE"

CONTAINER_NAME="react-container"

# Stop and remove container only if it exists
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping and removing existing container: $CONTAINER_NAME"
    docker stop $CONTAINER_NAME || true
    docker rm $CONTAINER_NAME || true
fi

# Run new container
echo "Running new container from image: $IMAGE"
IMAGE=$IMAGE docker-compose up -d --force-recreate
