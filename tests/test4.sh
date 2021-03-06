#!/bin/bash
set -eu

if [ ! -s sh ] ; then exit 1 ; fi

echo "cat < sh.c" | ./sh > tests/sh_4.tmp

if ! diff sh.c tests/sh_4.tmp &> /dev/null ; then
    echo "[4] redirected input for cat does not match"
    # rm -f tests/sh.tmp
    exit 1
else
    rm -f tests/sh_4.tmp
    exit 0
fi

