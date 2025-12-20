#!/bin/sh
set -e

HERE="$(dirname "$0")"
. "$HERE/ensure-pg-volume.sh"
. "$HERE/ensure-mrva-network.sh"

NAME=mrva-postgres

# running → no-op
if docker ps --format '{{.Names}}' | grep -qx "$NAME"; then
    exit 0
fi

# stopped → disposable
if docker ps -a --format '{{.Names}}' | grep -qx "$NAME"; then
    docker rm "$NAME"
fi

docker run -d \
       --network mrva\
       --name "$NAME" \
       --network-alias postgres \
       -p 5432:5432 \
       -v mrva-pgdata:/var/lib/postgresql/data \
       -e POSTGRES_USER=mrva \
       -e POSTGRES_PASSWORD=mrvapg \
       -e POSTGRES_DB=mrvadb \
       postgres:15
