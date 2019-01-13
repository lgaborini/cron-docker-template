#!/bin/sh
#
# Run the cron job:
# - write in the cron log
# - build the Docker image
# - mount a volume, then run the Docker image
#
# Call this script in the /etc/crontab.

# Get the absolute path to this script
PATH_SCRIPT=$(dirname $(realpath -s $0))

LOGGER_NAME="cron-docker-job"

# Docker options
WORKDIR="/payload"
DOCKER_IMAGE_NAME="cron-docker-image"

DOCKER_VOLUME_PATH_HOST="$PATH_SCRIPT/volume"
DOCKER_VOLUME_PATH_CONTAINER="$WORKDIR/volume"

logger -i -t "$LOGGER_NAME" "Ran cron script."

docker build -q -t "$DOCKER_IMAGE_NAME" "$PATH_SCRIPT"
docker run --rm -v "$DOCKER_VOLUME_PATH_HOST:$DOCKER_VOLUME_PATH_CONTAINER" "$DOCKER_IMAGE_NAME"
