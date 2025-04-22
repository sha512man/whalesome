#!/bin/sh

set -e

if [ -n "${USER}" ] ; then
    log "INFO: User specified" 1

    userName=$(echo "${USER}" | cut -d':' -f1)
    userId=$(echo "${USER}" | cut -d':' -f2)

    if id "${userName}" >/dev/null 2>&1; then
	      log "INFO: Found user ${userName}, deleting..." 2
        deluser "${userName}"
    fi

    if grep -q -E "^${userName}:" /etc/group; then
        log "INFO: Group ${userName} exists." 2
    else
        log "INFO: Group ${userName} not exists, creating..." 2
        addgroup --gid "${userId}" "${userName}"
    fi

    log "INFO: Creating new user ${userName}" 2

    rm -rf "/home/${userName}"

    adduser \
        --uid "${userId}" \
        --disabled-password \
        --ingroup "${userName}" \
        --home "/home/${userName}" \
        --gecos "" \
        "${userName}"

    if [ "${INIT_DEBUG}" = "3" ]; then
        cat /etc/passwd | grep "${userName}"
        cat /etc/group | grep "${userName}"
    fi
fi
