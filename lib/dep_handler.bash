function process() {
    if ! is_met; then
        meet
        is_met || fail
    fi
}

function requires() {
    __babashka_invoke "$1"
}

# $1 - dep name to invoke
function __babashka_invoke() {
    eval "$1"
}
