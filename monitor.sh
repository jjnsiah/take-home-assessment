#!/bin/bash

CONTAINER_NAME="assessment-web-app"

if docker ps --format '{{.Names}}' | grep -q "$CONTAINER_NAME"; then
  echo "Container '$CONTAINER_NAME' is running."
else
  echo "Container '$CONTAINER_NAME' is not running."
fi