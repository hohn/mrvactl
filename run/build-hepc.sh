#!/bin/sh
set -e

HERE="$(dirname "$0")"
. "$HERE/build-env.sh"

cd "$hepc_cont_dir"

rm -fR ./mrvahepc
rsync -a --exclude='*/venv/*' \
          --exclude='*/.git/*' \
          ../../../mrvahepc .

docker build -t mrva-hepc-container:0.4.5 -f Dockerfile .
