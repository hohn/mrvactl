#!/bin/sh
set -e

HERE="$(dirname "$0")"
. "$HERE/build-env.sh"

cd "$ghmrva_build_dir"
go build
cp gh-mrva "$ghmrva_cont_dir"

cd "$ghmrva_cont_dir"
docker build -t mrva-ghmrva:0.4.5 .
