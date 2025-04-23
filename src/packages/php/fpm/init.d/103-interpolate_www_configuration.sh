#!/bin/sh

set -e

mkdir -p \
    "${PHP_INI_DIR}/php-fpm.d"

tpl /opt/whalesome/packages/php/fpm/www.conf.tpl \
  fpmErrorLogDir="${FPM_ERROR_LOG_DIR}" \
  fpmRuntimeUser="${WWW_USER}" \
  fpmRuntimeGroup="${WWW_GROUP}" \
  fpmPort="${FPM_PORT}" \
  fpmPmMaxChildren="${FPM_PM_MAX_CHILDREN}" \
  fpmPmStartServers="${FPM_PM_START_SERVRES}" \
  fpmPmMinSpareServers="${FPM_PM_MIN_SPARE_SERVRES}" \
  fpmPmMaxSpareServers="${FPM_PM_MAX_SPARE_SERVRES}" \
  fpmAccessLog="${FPM_ACCESS_LOG}" \
  fpmRootDir="${FPM_ROOT_DIR}" > "${PHP_INI_DIR}/php-fpm.d/www.conf"

if [ "${INIT_DEBUG}" -ge "3" ]; then
    echodt "DEBUG: print generated www.conf"
    cat "${PHP_INI_DIR}/php-fpm.d/www.conf"
fi
