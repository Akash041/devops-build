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

# Stop and remove existing container (if not using compose down)
docker-compose down || true

# Run new container
echo "Running new container from image: $IMAGE"
IMAGE=$IMAGE docker-compose up -d --force-recreate
