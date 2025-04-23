#!/bin/sh

set -e

if [ "${INIT_DEBUG}" -ge "3" ]; then
    echodt "DEBUG: php --ini"
    echo "--------------------------"
    php --ini
    echo "--------------------------"
fi
