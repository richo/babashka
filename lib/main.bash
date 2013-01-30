function __babashka_main() {
    if [ $# -eq 1 ]; then
        __babashka_invoke "$1"
    else
        __babashka_usage
    fi
}
