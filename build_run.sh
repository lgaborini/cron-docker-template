#!/bin/sh
#

# Path to this script
PATH_SCRIPT=`dirname "$0"`

LOGGER_NAME="cron-docker-job"

# Docker options
WORKDIR="/payload"
DOCKER_IMAGE_NAME="cron-docker-image"

DOCKER_VOLUME_PATH_HOST="$PATH_SCRIPT/volume"
DOCKER_VOLUME_PATH_CONTAINER="$WORKDIR/volume"

logger -i -t "$LOGGER_NAME" "Ran cron script."

docker build -q -t "$DOCKER_IMAGE_NAME" .
docker run -it --rm -v "$DOCKER_VOLUME_PATH_HOST:$DOCKER_VOLUME_PATH_CONTAINER" "$DOCKER_IMAGE_NAME"

