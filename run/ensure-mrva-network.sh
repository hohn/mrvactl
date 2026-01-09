#!/bin/sh
# ensure-mrva-network.sh
# Idempotently ensure the MRVA docker network exists.

set -e

NETWORK="mrva"

if docker network inspect "$NETWORK" >/dev/null 2>&1; then
    return 0 2>/dev/null || exit 0
fi

docker network create "$NETWORK" >/dev/null
