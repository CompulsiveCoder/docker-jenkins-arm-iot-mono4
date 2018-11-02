#!/bin/bash

#DOCKERHUB_USERNAME="username"
#DOCKERHUB_PASSWORD="password"

if [ ! "$DOCKERHUB_USERNAME" ]; then
  echo "No DOCKERHUB_USERNAME environment variable found."
  exit 1
fi

if [ ! "$DOCKERHUB_PASSWORD" ]; then
  echo "No DOCKERHUB_PASSWORD environment variable found."
  exit 1
fi

echo "$DOCKERHUB_PASSWORD" | docker login -u $DOCKERHUB_USERNAME --password-stdin
