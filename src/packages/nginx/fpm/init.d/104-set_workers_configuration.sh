#!/bin/sh

set -ex

cores=$(nproc --all)
defaultConnections="4096"

if [ ! -z "${cores}" ]; then
    defaultConnections=$((cores * 1024))
fi

[ -z "${WORKER_PROCESSES}" ] && WORKER_PROCESSES="worker_processes auto;"
[ -z "${WORKER_CONNECTIONS}" ] && WORKER_CONNECTIONS="worker_connections ${defaultConnections};"
[ -z "${WORKER_RLIMIT_NO_FILE}" ] && WORKER_RLIMIT_NO_FILE="worker_rlimit_nofile ${defaultConnections};"

sed -i -e "
s~\# whalesome.nginx.placeholders.worker_processes~${WORKER_PROCESSES}~g
s~\# whalesome.nginx.placeholders.worker_rlimit_no_file~${WORKER_RLIMIT_NO_FILE}~g
s~\# whalesome.nginx.placeholders.worker_connections~${WORKER_CONNECTIONS}~g
" /etc/nginx/nginx.conf
