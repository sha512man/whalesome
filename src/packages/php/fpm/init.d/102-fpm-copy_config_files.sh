#!/bin/sh

set -ex

mkdir -p \
    /usr/local/etc/php \
    /usr/local/etc/php/php-fpm.d

cp /opt/whalesome/packages/php/fpm/php-fpm.conf \
    /opt/whalesome/packages/php/fpm/php.ini \
    /usr/local/etc/php

cp /opt/whalesome/packages/php/fpm/www.conf \
    /usr/local/etc/php/php-fpm.d
