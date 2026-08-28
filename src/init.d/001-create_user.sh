#!/bin/sh

set -e

if [ -n "${USER}" ] ; then
    log "INFO: User specified" 1

    userName=$(echo "${USER}" | cut -d':' -f1)
    userId=$(echo "${USER}" | cut -d':' -f2)
    preserveExistingUser="${PRESERVE_EXISTING_USER:-0}"
    preserveHome="${PRESERVE_HOME:-0}"

    existingUser=false
    previousUid=""
    previousGid=""

    if id "${userName}" >/dev/null 2>&1; then
        existingUser=true
        previousUid=$(id -u "${userName}")
        previousGid=$(id -g "${userName}")

        if [ "${preserveExistingUser}" = "1" ]; then
            log "INFO: Found user ${userName}, preserving and migrating UID/GID..." 2
        else
            log "INFO: Found user ${userName}, deleting..." 2
            deluser "${userName}"
        fi
    fi

    if grep -q -E "^${userName}:" /etc/group; then
        currentGroupId=$(getent group "${userName}" | cut -d':' -f3 || true)

        if [ -n "${currentGroupId}" ] && [ "${currentGroupId}" != "${userId}" ]; then
            log "INFO: Updating group ${userName} GID from ${currentGroupId} to ${userId}" 2
            groupmod --gid "${userId}" "${userName}"
        fi
    else
        log "INFO: Group ${userName} not exists, creating..." 2
        addgroup --gid "${userId}" "${userName}"
    fi

    if [ "${preserveExistingUser}" = "1" ] && [ "${existingUser}" = "true" ]; then
        if [ "$(id -u "${userName}")" != "${userId}" ]; then
            log "INFO: Updating ${userName} UID to ${userId}" 2
            usermod --uid "${userId}" "${userName}"
        fi

        if [ "$(id -g "${userName}")" != "${userId}" ]; then
            log "INFO: Updating ${userName} GID to ${userId}" 2
            usermod --gid "${userName}" "${userName}"
        fi

        if [ -n "${previousUid}" ] && [ "${previousUid}" != "${userId}" ]; then
            log "INFO: Reassigning files from UID ${previousUid} to ${userId}" 2
            find / -xdev -uid "${previousUid}" -exec chown "${userName}" {} + 2>/dev/null || true
        fi

        if [ -n "${previousGid}" ] && [ "${previousGid}" != "${userId}" ]; then
            log "INFO: Reassigning files from GID ${previousGid} to ${userId}" 2
            find / -xdev -gid "${previousGid}" -exec chgrp "${userName}" {} + 2>/dev/null || true
        fi
    else
        log "INFO: Creating new user ${userName}" 2

        if [ "${preserveHome}" = "1" ]; then
            log "INFO: Preserving home directory for user ${userName}" 2
        else
            log "INFO: Removing home directory for user ${userName}" 2
            rm -rf "/home/${userName}"
        fi

        adduser \
            --uid "${userId}" \
            --disabled-password \
            --ingroup "${userName}" \
            --home "/home/${userName}" \
            --gecos "" \
            "${userName}"
    fi

    if [ "${INIT_DEBUG}" = "3" ]; then
        cat /etc/passwd | grep "${userName}"
        cat /etc/group | grep "${userName}"
    fi
fi
