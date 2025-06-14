#!/bin/bash
set -e

BRANCH_NAME=${BRANCH_NAME:-dev}

if [ "$BRANCH_NAME" = "main" ]; then
    IMAGE="akashadmin07/react-app-prod:latest"
    CONTAINER_NAME="react-container-prod"
    PORT="90"
else
    IMAGE="akashadmin07/react-app-dev:latest"
    CONTAINER_NAME="react-container-dev"
    PORT="80"
fi

echo "Using image: $IMAGE"
echo "Container name: $CONTAINER_NAME"
echo "Port: $PORT"

# Stop and remove container if it exists
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping and removing existing container: $CONTAINER_NAME"
    docker rm -f $CONTAINER_NAME || true
fi

# Run new container
echo "Running new container from image: $IMAGE"
IMAGE=$IMAGE CONTAINER_NAME=$CONTAINER_NAME PORT=$PORT docker-compose up -d

