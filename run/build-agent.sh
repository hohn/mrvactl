#!/bin/sh
set -e

HERE="$(dirname "$0")"
. "$HERE/build-env.sh"

cd "$agent_build_dir"
go build
cp mrvaagent "$agent_cont_dir"

cd "$agent_cont_dir"
docker build -t mrva-agent:0.4.5 .
