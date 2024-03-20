#!/bin/sh

set -ex

mkdir -p /usr/share/nginx/maintenance

tpl /opt/whalesome/packages/nginx/revprox/nginx.conf.tpl \
  userName=nginx > /etc/nginx/nginx.conf
