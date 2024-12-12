#!/bin/bash

CONTAINER_NAME="assessment-web-app"

# check if container is running, wait for 20 seconds and check if app is accessible via localhost
if docker ps --format '{{.Names}}' | grep -q "$CONTAINER_NAME"; then
  echo "Container '$CONTAINER_NAME' is running."

  sleep 20
  curl --fail http://localhost:3000 || exit 1

else
  echo "Container '$CONTAINER_NAME' is not running."
fi