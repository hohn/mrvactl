wait_for() {
    what="$1"
    cmd="$2"
    tries="${3:-4}"

    i=0
    while ! sh -c "$cmd"; do
        i=$((i+1))
        [ "$i" -ge "$tries" ] && return 1
        sleep 1
    done
}
