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
tpl /opt/whalesome/packages/nginx/fpm/nginx.conf.tpl \
  defaultConnections="${DEFAULT_CONNECTIONS}" \
  dnsResolver="${DNS_RESOLVER}" \
  fpmHost="${FPM_HOST}" \
  fpmPingPath="${FPM_PING_PATH}" \
  fpmPort="${FPM_PORT}" \
  fpmStatusListenPort="${FPM_STATUS_LISTEN_PORT}" \
  fpmStatusPath="${FPM_STATUS_PATH}" \
  statusAllowIp="${STATUS_ALLOW_IP}" \
  httpErrorsDir="${HTTP_ERRORS_DIR}" \
  nginxProcessUser="${NGINX_PROCESS_USER}" \
  nginxRootDir="${NGINX_ROOT_DIR}" \
  workerConnections="${WORKER_CONNECTIONS}" \
  workerProcesses="${WORKER_PROCESSES}" \
  workerRlimitNoFile="${WORKER_RLIMIT_NO_FILE}" > "${NGINX_CONFIG_DIR}/nginx.conf"

if [ "${INIT_DEBUG}" -ge "3" ]; then
    echodt "DEBUG: print generated nginx.conf"
    cat "${NGINX_CONFIG_DIR}/nginx.conf"
fi
