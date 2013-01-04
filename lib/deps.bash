function __babashka_load_deps() {
    for path in deps babashka_deps ~/.babashka/deps; do
        if [ -d $path ]; then
            __babashka_load_deps_from_path "$path"
        fi
    done
}

# $1 - path to search over
# [$2] - pattern to match for deps
function __babashka_find_deps_from_path() {
    find "$1" -type f # -iname "*.${2:-babsh}"
                      # TODO
}

# $1 - path to load deps from
function __babashka_load_deps_from_path() {
    for path in `__babashka_find_deps_from_path "$1"`; do
        source $path
    done
}
