#!/usr/bin/env bash

. ../bashrc
. assert.sh
#test

assert "echo $_SHELL" "bash\n"
assert_end $0
