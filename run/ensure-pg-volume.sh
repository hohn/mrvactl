#!/bin/sh
# ensure-pg-volume.sh
# Idempotently ensure the Postgres data volume exists.

set -e

VOLUME="mrva-pgdata"

if docker volume inspect "$VOLUME" >/dev/null 2>&1; then
    return 0
fi

docker volume create "$VOLUME" >/dev/null
