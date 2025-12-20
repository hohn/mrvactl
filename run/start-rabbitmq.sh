#!/bin/sh
set -e

NAME=mrva-rabbitmq

# running → no-op
if docker ps --format '{{.Names}}' | grep -qx "$NAME"; then
    exit 0
fi

# stopped → disposable
if docker ps -a --format '{{.Names}}' | grep -qx "$NAME"; then
    docker rm "$NAME"
fi

HERE="$(dirname "$0")"
. "$HERE/ensure-mrva-network.sh"

docker run -d \
       --name mrva-rabbitmq \
       --network mrva\
       -p 5672:5672 \
       -p 15672:15672 \
       -v "$HERE"/init/rabbitmq.conf:/etc/rabbitmq/conf.d/20-mrva.conf:ro \
       -v "$HERE"/init/definitions.json:/etc/rabbitmq/definitions.json:ro \
       rabbitmq:3-management
