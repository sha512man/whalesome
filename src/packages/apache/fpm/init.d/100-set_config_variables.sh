#!/bin/sh

[ -z "${APACHE_ROOT_DIR}" ] && APACHE_ROOT_DIR="/var/www/public"
[ -z "${FPM_HOST}" ] && FPM_HOST="php-fpm"
[ -z "${FPM_PORT}" ] && FPM_PORT="9000"
[ -z "${FPM_DISABLE_REUSE}" ] && FPM_DISABLE_REUSE="On"
[ -z "${ADMIN_EMAIL}" ] && ADMIN_EMAIL="info@litea.cz"
[ -z "${ERRORS_DIR}" ] && ERRORS_DIR="/opt/whalesome/packages/apache/fpm/errors"
[ -z "${PROCESS_USER}" ] && PROCESS_USER="www-data"
[ -z "${PROCESS_GROUP}" ] && PROCESS_GROUP="www-data"

sed -e "
s~%root_dir%~${APACHE_ROOT_DIR}~g
s~%fcgi_host%~${FPM_HOST}~g
s~%fcgi_port%~${FPM_PORT}~g
s~%fcgi_disable_reuse%~${FPM_DISABLE_REUSE}~g
s~%admin_email%~${ADMIN_EMAIL}~g
s~%errors_dir%~${ERRORS_DIR}~g
s~%process_user%~${PROCESS_USER}~g
s~%process_group%~${PROCESS_GROUP}~g
" /opt/whalesome/packages/apache/fpm/httpd.conf > /usr/local/apache2/conf/httpd.conf