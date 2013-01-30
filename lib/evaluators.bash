file_exists() {
    if [ "${1:0:7}" = "hdfs://" ]; then
        hadoop fs -test -e "$1"
    else
        test -f "$1"
    fi
}

dir_exists() {
    if [ "${1:0:7}" = "hdfs://" ]; then
        hadoop fs -test -d "$1"
    else
        test -f "$1"
    fi
}

file_mtime() {
    if [ "${1:0:7}" = "hdfs://" ]; then
        echo $(( $(hadoop fs -stat %Y "$1") / 1000 ))
    else
        stat -c %Y "$1"
    fi
}

file_is_newer() {
    target_mtime=$(file_mtime "$1")
    shift
    for f in "$@"; do
        mtime=$(file_mtime "$f")
        if [ $mtime -gt $target_mtime ]; then
            return 1
        fi
    done
    return 0
}

