#!/bin/sh
set -e

HERE="$(dirname "$0")"
. "$HERE/build-env.sh"

cd "$server_build_dir"
go build
cp mrvaserver "$server_cont_dir"

cd "$server_cont_dir"
docker build -t mrva-server:0.4.5 .
