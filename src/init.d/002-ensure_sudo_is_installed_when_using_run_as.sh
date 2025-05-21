#!/bin/sh

set -e

if [ -n "${RUN_AS}" ] ; then
    if ! command -v sudo &> /dev/null; then
        echodt "ERROR: sudo package is not installed, please use 'pkg sudo'"
        exit 1
    fi
fi
