#!/bin/sh
set -eu

HERE="$(dirname "$0")"

. "$HERE/graph.sh"
. "$HERE/lib/log.sh"
. "$HERE/lib/die.sh"
. "$HERE/lib/wait.sh"

is_optional() {
    for x in $OPTIONAL; do
        [ "$x" = "$1" ] && return 0
    done
    return 1
}

is_external() {
    for x in $EXTERNAL; do
        [ "$x" = "$1" ] && return 0
    done
    return 1
}

start_group() {
    group="$1"
    services="$(eval echo \$$group)"

    log "starting group: $group [$services]"

    for svc in $services; do
        if is_external "$svc"; then
            log "skipping start of external service: $svc"
        else
            "$HERE/start-$svc.sh" || die "start $svc failed"

            if "$HERE/probe-$svc.sh"; then
                :
            else
                if wait_for "$svc" "$HERE/probe-$svc.sh"; then
                    :
                else
                    if is_optional "$svc"; then
                        log "optional service not available: $svc"
                    else
                        die "probe $svc failed"
                    fi
                fi
            fi
        fi

    done
}

for g in $MRVA_GROUPS; do
    start_group "$g"
done

log "all services started"
