#!/bin/sh

set -e

if [ -n "${RUN_AS}" ] ; then
  if [ -n "${USE_SU_EXEC}" ] && [ "${USE_SU_EXEC}" = "1" ]; then
    if ! command -v su-exec &> /dev/null; then
        echodt "ERROR: su-exec package not found. Install it via 'pkg su-exec'"
        exit 1
    fi
  else
    if ! command -v sudo &> /dev/null; then
        echodt "ERROR: sudo package not found. Install it via 'pkg sudo'"
        exit 1
    fi
  fi
fi
