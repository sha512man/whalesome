#!/bin/sh

set -e

if [ -n "${RUN_AS}" ] ; then
  if [ -n "${USE_SU_EXEC}" ] && [ "${USE_SU_EXEC}" = "1" ]; then
    if ! command -v su-exec >/dev/null 2>&1; then
        echodt "ERROR: su-exec package not found. Install it via 'pkg su-exec'"
        exit 1
    fi
  elif [ -n "${USE_SETPRIV}" ] && [ "${USE_SETPRIV}" = "1" ]; then
    if ! command -v setpriv >/dev/null 2>&1; then
        echodt "ERROR: setpriv package not found. Install it via 'pkg util-linux'"
        exit 1
    fi
  else
    if ! command -v sudo >/dev/null 2>&1; then
        echodt "ERROR: sudo package not found. Install it via 'pkg sudo'"
        exit 1
    fi
  fi
fi
