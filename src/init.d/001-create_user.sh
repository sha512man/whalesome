#!/bin/sh

if [ ! -z "${USER}" ] ; then
    echo "User specified"

    userName=$(echo ${USER} | cut -d':' -f1)
    userId=$(echo ${USER} | cut -d':' -f2)

    if id "${userName}" >/dev/null 2>&1; then
	    echo "Found user ${userName}, deleting..."
      deluser "${userName}"
    fi

    if grep -q -E "^${userName}:" /etc/group; then
      echo "Found group ${userName}, deleting..."
      delgroup "${userName}"
    fi

    echo "Creating new user ${userName}"

    adduser \
        --uid "${userId}" \
        --disabled-password \
        --gecos "" \
    "${userName}"

    chown -R "${userName}:${userName}" "/home/${userName}"
fi
