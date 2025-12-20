#!/bin/sh
# build-all.sh — build selected MRVA containers
# Selection is declarative (see build.sh)

set -eu

HERE="$(dirname "$0")"

log() {
    printf '[%s] %s\n' "$(date +%H:%M:%S)" "$*"
}

die() {
    echo "FATAL: $*" >&2
    exit 1
}

. "$HERE/build.sh"

BUILDS="$CORE_BUILDS"

for b in $BUILDS; do
    script="$HERE/$b"
    log "running $b"
    [ -x "$script" ] || die "missing or non-executable: $script"
    "$script" || die "$b failed"
done

log "all builds completed successfully"
