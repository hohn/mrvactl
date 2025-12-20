#!/bin/sh
# rm-pg-volume.sh
# Explicitly remove the Postgres data volume.
# This is a destructive operation.

set -e

VOLUME="mrva-pgdata"

if ! docker volume inspect "$VOLUME" >/dev/null 2>&1; then
    echo "volume $VOLUME does not exist"
    exit 0
fi

echo "removing docker volume: $VOLUME"
docker volume rm "$VOLUME"
