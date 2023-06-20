#!/bin/sh

replace_content=""

[ -z "${FPM_HOST}" ] && FPM_HOST="php-fpm"
[ -z "${FPM_PORT}" ] && FPM_PORT="9000"

if [ ! -z "${DISABLE_DNS_CACHE}" ] && [ "${DISABLE_DNS_CACHE}"="1" ]; then
    if [ -z "${DNS_RESOLVER}" ]; then
        echo "You must provide resolver in order to disable DNS cache"
        exit 1
    fi

    echo "Disabling DNS cache"

    replace_content="
        resolver ${DNS_RESOLVER} valid=5s ipv6=off;
        set \$fpm_upstream \"${FPM_HOST}:${FPM_PORT}\";
        fastcgi_pass \$fpm_upstream;
    "
else
    replace_content="
        fastcgi_pass ${FPM_HOST}:${FPM_PORT};
    "
fi

tmp=$(mktemp)
echo "${replace_content}" > "${tmp}"

echo "Setting fastcgi pass configuration"

sed -i \
    -e "/\# whalesome.nginx.placeholders.fastcgi_pass/r ${tmp}" \
    -e "//d" \
    /etc/nginx/nginx.conf;

rm "${tmp}"