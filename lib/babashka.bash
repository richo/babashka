__babashka_log() {
    printf "%*s"  "$__babashka_current_indent"
    printf "%s\n" "$@"
}

__babashka_fail() {
    echo ERROR: "$@" 1>&2
    exit 1
}

unmeetable() {
    __babashka_fail "$@"
}
