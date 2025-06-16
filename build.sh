#!/bin/bash
set -e
echo "Start build.sh"
docker build -t react-app .
