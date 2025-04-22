#!/bin/sh

set -e

CHOWN_OPTIONS="-L";

if [ "${INIT_DEBUG}" = "2" ]; then
    CHOWN_OPTIONS="-Lc"
fi

if [ -n "${RUN_AS}" ] ; then
    chown ${CHOWN_OPTIONS} "${RUN_AS}" \
        /proc/self/fd/1 \
        /proc/self/fd/2
fi
