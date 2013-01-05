#!/bin/bash

# dep "foo"
function foo() {
    requires "bar"
    function is_met() {
        [ -f /tmp/sometestbabashkafile ]
    }
    function meet() {
        touch /tmp/sometestbabashkafile
    }
    process
}

function bar() {
    function is_met() {
        true
    }
    process
}
