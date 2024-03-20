#!/bin/sh

set -ex

mkdir -p /usr/local/etc/php/conf.d

cp /opt/whalesome/packages/php/xdebug/xdebug.ini \
    /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
