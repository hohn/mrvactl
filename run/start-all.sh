#!/bin/sh
set -eu

HERE="$(dirname "$0")"

. "$HERE/graph.sh"
. "$HERE/lib/log.sh"
. "$HERE/lib/die.sh"
. "$HERE/lib/wait.sh"


start_group() {
    group="$1"
    services="$(eval echo \$$group)"

    log "starting group: $group [$services]"

    for svc in $services; do
        "$HERE/start-$svc.sh" || die "start $svc failed"

        if "$HERE/probe-$svc.sh"; then
            :
        else
            if wait_for "$svc" "$HERE/probe-$svc.sh"; then
                :
            else
                die "probe $svc failed"
            fi
        fi

    done
}

for g in $MRVA_GROUPS; do
    start_group "$g"
done

log "all services started"
