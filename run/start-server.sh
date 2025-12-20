#!/bin/sh
set -e

HERE="$(dirname "$0")"
. "$HERE/env.sh"
. "$HERE/ensure-mrva-network.sh"

NAME=mrva-server

# running → no-op
if docker ps --format '{{.Names}}' | grep -qx "$NAME"; then
    exit 0
fi

# stopped → disposable
if docker ps -a --format '{{.Names}}' | grep -qx "$NAME"; then
    docker rm "$NAME"
fi

docker run -d \
       --name "$NAME"                           \
       --network mrva                           \
       -p 8080:8080                             \
       -e MRVA_RABBITMQ_HOST                    \
       -e MRVA_RABBITMQ_PORT                    \
       -e MRVA_RABBITMQ_USER                    \
       -e MRVA_RABBITMQ_PASSWORD                \
       -e ARTIFACT_MINIO_ENDPOINT               \
       -e ARTIFACT_MINIO_ID                     \
       -e ARTIFACT_MINIO_SECRET                 \
       -e QLDB_MINIO_ENDPOINT                   \
       -e QLDB_MINIO_ID                         \
       -e QLDB_MINIO_SECRET                     \
       -e MRVA_HEPC_CACHE_DURATION              \
       -e MRVA_HEPC_ENDPOINT                    \
       -e MRVA_MINIO_VIRTUAL_HOST               \
       -e MRVA_HEPC_DATAVIACLI                  \
       -e MRVA_HEPC_REFROOT                     \
       -e MRVA_HEPC_OUTDIR                      \
       -e MRVA_HEPC_TOOL                        \
       -e MRVA_HEPC_COMMAND                     \
       -e POSTGRES_USER                             \
       -e POSTGRES_PASSWORD                         \
       -e POSTGRES_DB                               \
       -e POSTGRES_HOST                             \
       -e POSTGRES_PORT                             \
       mrva-server:0.4.5                        \
       --mode=container --loglevel=debug
