#!/bin/bash

# dep "foo"
function foo() {
    # requires "foo_first_dependency"
    # requires "foo_second_dependency"
    function is_met() {
        [ -f /tmp/sometestbabashkafile ]
    }
    function meet() {
        touch /tmp/sometestbabashkafile
    }
    process
}
