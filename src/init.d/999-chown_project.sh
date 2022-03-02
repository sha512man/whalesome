#!/bin/sh

if [ ! -z "${USER}" ] && [ ! -z "${CHOWN_PROJECT}" ]; then
  echo "Changing project ownership to user ${USER}"
  userName=$(echo ${USER} | cut -d':' -f1)
  chown -R "${userName}:${userName}" "${APP_DIR}"
fi
