__babashka_log() {
    echo "$@"
}

__babashka_fail() {
    echo ERROR: "$@" 1>&2
    exit 1
}

unmeetable() {
    __babashka_fail "$@"
}
