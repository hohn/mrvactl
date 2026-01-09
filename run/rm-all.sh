#!/bin/sh
# rm-all.sh — stop and remove all MRVA containers
# Explicit teardown. No volumes. No images. No pruning.

set -eu

CONTAINERS="
mrva-agent
mrva-ghmrva
mrva-hepc
mrva-minio
mrva-server
mrvastore
mrva-postgres
mrva-rabbitmq
"

log() {
    printf '[rm] %s\n' "$*"
}

for c in $CONTAINERS; do
    if docker ps --format '{{.Names}}' | grep -qx "$c"; then
        log "stopping $c"
        docker stop "$c" >/dev/null
    fi

    if docker ps -a --format '{{.Names}}' | grep -qx "$c"; then
        log "removing $c"
        docker rm "$c" >/dev/null
    fi
done

log "done"
