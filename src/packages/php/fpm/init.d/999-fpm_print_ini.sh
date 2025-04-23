#!/bin/sh

set -e

if [ "${INIT_DEBUG}" -ge "3" ]; then
    echo "DEBUG: php --ini"
    php --ini
fi
