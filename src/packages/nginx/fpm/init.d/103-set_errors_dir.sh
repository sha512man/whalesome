#!/bin/sh

[ -z "${HTTP_ERRORS_DIR}" ] && HTTP_ERRORS_DIR="/opt/whalesome/packages/nginx/fpm/errors"

mkdir -p "${HTTP_ERRORS_DIR}"

replace_content="
    error_page   404  /404.html;
    error_page   403  /403.html;
    error_page   500  /500.html;
    error_page   502  /502.html;
    error_page   503  /503.html;
    error_page   504  /504.html;

    location ~ /(500|502|503|504|404|403).html$ {
        root ${HTTP_ERRORS_DIR};
    }
"

tmp=$(mktemp)
echo "${replace_content}" > "${tmp}"

sed -i \
    -e "/\# litea.nginx.placeholders.static_http_errors/r ${tmp}" \
    -e "//d" \
    /etc/nginx/nginx.conf

rm "${tmp}"