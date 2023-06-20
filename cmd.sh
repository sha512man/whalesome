#!/bin/sh

case "${1}" in
    "build-local")
        docker build \
            -t "sha512man/whalesome:local" \
            -f "Dockerfile" \
        .
    ;;

    "run-local")
        shift 1

        docker run \
            -it \
            --rm \
            "sha512man/whalesome:local" \
            ${@}
        ;;

    *)
      echo "Command ${@} not found"
      ;;
esac
