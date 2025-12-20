#!/bin/sh
. "$HERE/ensure-mrva-network.sh"
docker run -d --rm \
       --network mrva \
       --name mrva-hepc \
       -p 8070:8070 \
       mrva-hepc-container:0.4.5 \
       host-hepc-serve \
       --codeql-db-dir /home/hohn/work-gh/mrva/mrvahepc/db-collection-host.tmp \
       --host 0.0.0.0 \
       --port 8070
