#!/bin/bash
set -x #echo on

CURRENT_DIR="${PWD##*/}"
IMAGE_NAME="gburanov/$CURRENT_DIR"

docker run \
  -p 0.0.0.0:80:4567 \
  -e FYBER_DEVICE_ID=$FYBER_DEVICE_ID \
  -e FYBER_API_KEY=$FYBER_API_KEY \
  ${IMAGE_NAME}:latest
