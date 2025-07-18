#!/bin/sh

set -e

########## DNS section ##########
NGINX_CONFIG_DIR="/etc/nginx"
if [ -n "${DISABLE_DNS_CACHE}" ] && [ "${DISABLE_DNS_CACHE}" = "1" ]; then
  if [ -z "${DNS_RESOLVER}" ]; then
    echo "You must provide resolver in order to disable DNS cache"
    exit 1
  fi
else
  DNS_RESOLVER=""
fi

########## Errors section ##########
[ -z "${HTTP_ERRORS_DIR}" ] && HTTP_ERRORS_DIR="/opt/whalesome/packages/nginx/fpm/errors"
mkdir -p "${HTTP_ERRORS_DIR}"

########## Connection section ##########
cores=$(nproc --all)
DEFAULT_CONNECTIONS="4096"

if [ -n "${cores}" ]; then
  DEFAULT_CONNECTIONS=$((cores * 1024))
fi

########## Interpolating  ##########
tpl /opt/whalesome/packages/nginx/fpm/fastcgi_resolver.tpl \
  dnsResolver="${DNS_RESOLVER}" \
  fpmHost="${FPM_HOST}" \
  fpmPort="${FPM_PORT}" > "${NGINX_CONFIG_DIR}/fastcgi_resolver"

if [ "${INIT_DEBUG}" -ge "3" ]; then
  echodt "DEBUG: print generated fastcgi_resolver"
  cat "${NGINX_CONFIG_DIR}/fastcgi_resolver"
fi
