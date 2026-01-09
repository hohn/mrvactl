#!/bin/sh

HERE="$(dirname "$0")"
. "$HERE/ensure-mrva-network.sh"

docker run -d --rm \
       --network mrva \
       --name mrva-hepc \
       -p 8070:8070 \
       -v /home/hohn/work-gh/mrva/mrvahepc/db-collection-host.tmp:/home/hohn/work-gh/mrva/mrvahepc/db-collection-host.tmp:ro \
       -v /home/hohn/work-gh/mrva/mrva-open-source-download:/home/hohn/work-gh/mrva/mrva-open-source-download:ro \
       mrva-hepc-container:0.4.5 \
       host-hepc-serve \
       --codeql-db-dir /home/hohn/work-gh/mrva/mrvahepc/db-collection-host.tmp \
       --host 0.0.0.0 \
       --port 8070
