#!/bin/bash
set -e

if [ "$BRANCH_NAME" == "main" ]; then
    IMAGE="akashadmin07/react-app-prod:latest"
else
    IMAGE="akashadmin07/react-app-dev:latest"
fi

# Remove previous container if running
docker rm -f react-container || true

# Run the new container
docker run -d -p 80:80 --name react-container $IMAGE


