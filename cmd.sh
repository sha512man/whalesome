#!/bin/sh

case "${1}" in
    "build-local")
        docker build \
            -t "liteacz/whalesome:local" \
            -f "Dockerfile" \
        .
    ;;

    "run-local")
        shift 1

        docker run \
            -it \
            --rm \
            "liteacz/whalesome:local" \
            ${@}
        ;;

    *)
      echo "Command ${@} not found"
      ;;
esac
