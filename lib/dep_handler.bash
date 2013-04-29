function process() {
    if ! process_is_met; then
        process_meet
        process_is_met || __babashka_fail "dependency didn't converge"
    fi
}

function process_is_met() {
    __babashka_log "==> is met? "
    is_met > $__babashka_output_stream
    st=$?
    __babashka_log " $st"
    return $st
}

function process_meet() {
    __babashka_log "==> meet "
    meet > $__babashka_output_stream
    st=$?
    __babashka_log "$st"
}

function requires() {
    __babashka_invoke "$1"
}

# $1 - dep name to invoke
function __babashka_invoke() {
    (( __babashka_current_indent = $__babashka_current_indent + 1 ))
    __babashka_log "-> $1"
    eval "$1"
    (( __babashka_current_indent = $__babashka_current_indent - 1 ))
}
