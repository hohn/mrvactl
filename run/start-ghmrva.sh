#!/bin/sh

HERE="$(dirname "$0")"
. "$HERE/ensure-mrva-network.sh"

docker run -d \
       --network mrva                           \
       --name mrva-ghmrva   \
       -e MRVA_SERVER_URL=http://localhost:8080 \
       mrva-ghmrva:0.4.5
