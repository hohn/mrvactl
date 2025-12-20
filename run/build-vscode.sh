#!/bin/sh
set -e

HERE="$(dirname "$0")"
. "$HERE/build-env.sh"

cd "$vscode_cont_dir"
docker build -t code-server-initialized:0.4.5 .
