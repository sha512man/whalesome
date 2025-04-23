#!/bin/sh

set -e

HOST_IP=$(ip route show default | awk '/default/ {print $3}')

[ -z "$XDEBUG_CLIENT_HOST" ] && XDEBUG_CLIENT_HOST="$HOST_IP"

tpl /opt/whalesome/packages/php/xdebug/xdebug.ini.tpl \
  xdebugExtensionPath=$XDEBUG_EXTENSION_PATH \
  xdebugMode=$XDEBUG_MODE \
  xdebugStartWithRequest=$XDEBUG_START_WITH_REQUEST \
  xdebugClientHost=$XDEBUG_CLIENT_HOST \
  xdebugClientPort=$XDEBUG_CLIENT_PORT \
  xdebugRemoteHandler=$XDEBUG_REMOTE_HANDLER \
  xdebugDiscoverClientHost=$XDEBUG_DISCOVER_CLIENT_HOST \
  xdebugOutputDir=$XDEBUG_OUTPUT_DIR \
  xdebugIdeKey=$XDEBUG_IDE_KEY \
  xdebugProfilerOutputName=$XDEBUG_PROFILER_OUTPUT_NAME > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
