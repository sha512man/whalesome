#!/bin/sh

set -e

PHP_FPM_CONFIG_DIR="/usr/local/etc/php-fpm.d"

tpl /opt/whalesome/packages/php/fpm/www.conf.tpl \
  fpmErrorLogDir="${FPM_ERROR_LOG_DIR}" \
  fpmRuntimeUser="${WWW_USER}" \
  fpmRuntimeGroup="${WWW_GROUP}" \
  fpmPort="${FPM_PORT}" \
  fpmPingPath="${FPM_PING_PATH}" \
  fpmStatusPath="${FPM_STATUS_PATH}" \
  fpmStatusListenPort="${FPM_STATUS_LISTEN_PORT}" \
  fpmPmMaxChildren="${FPM_PM_MAX_CHILDREN}" \
  fpmPmStartServers="${FPM_PM_START_SERVRES}" \
  fpmPmMinSpareServers="${FPM_PM_MIN_SPARE_SERVRES}" \
  fpmPmMaxSpareServers="${FPM_PM_MAX_SPARE_SERVRES}" \
  fpmAccessLog="${FPM_ACCESS_LOG}" \
  fpmRootDir="${FPM_ROOT_DIR}" > "${PHP_FPM_CONFIG_DIR}/www.conf"

if [ "${INIT_DEBUG}" -ge "3" ]; then
    echodt "DEBUG: print generated www.conf"
    cat "${PHP_FPM_CONFIG_DIR}/www.conf"
fi
