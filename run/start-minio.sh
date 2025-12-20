#!/bin/sh
set -e

HERE="$(dirname "$0")"
. "$HERE/env.sh"
. "$HERE/ensure-mrva-network.sh"

NAME=mrvastore

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
       -p 9000:9000 \
       -p 9001:9001 \
       -e MINIO_ROOT_USER \
       -e MINIO_ROOT_PASSWORD \
       minio/minio:RELEASE.2024-06-11T03-13-30Z \
       server /data --console-address ":9001"
