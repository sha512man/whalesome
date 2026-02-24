#!/bin/sh

set -e

if [ -n "${RUN_AS}" ] ; then
    if ! command -v su-exec &> /dev/null; then
        echodt "ERROR: su-exec package is not installed, please install 'pkg su-exec'"
        exit 1
    fi
fi
