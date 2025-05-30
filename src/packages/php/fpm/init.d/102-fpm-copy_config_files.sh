#!/bin/sh

set -e

[ -z "${FPM_PHP_INI_ENV}" ] && FPM_PHP_INI_ENV="production"

PHP_INI_FILE_ENV="${PHP_INI_DIR}/php.ini-${FPM_PHP_INI_ENV}"

if [ -f "${PHP_INI_FILE_ENV}" ]; then
    log "INFO: copy ${PHP_INI_FILE_ENV} into ${PHP_INI_DIR}" 2
    cp "${PHP_INI_FILE_ENV}" "${PHP_INI_DIR}/php.ini"
fi
