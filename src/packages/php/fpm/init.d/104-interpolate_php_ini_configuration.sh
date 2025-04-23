#!/bin/sh

set -e

tpl /opt/whalesome/packages/php/fpm/php.ini.tpl \
  phpMaxExecutionTime="${PHP_MAX_EXECUTION_TIME}" \
  phpMaxInputTime="${PHP_MAX_INPUT_TIME}" \
  phpMemoryLimit="${PHP_MEMORY_LIMIT}" \
  phpErrorReporting="{$PHP_ERROR_REPORTING}" \
  phpErrorLogDir="${PHP_ERROR_LOG_DIR}" \
  phpPostMaxSize="${PHP_POST_MAX_SIZE}" \
  phpRootDir="{$PHP_ROOT_DIR}" \
  phpUploadMaxFilesize="${PHP_UPLOAD_MAX_FILESIZE}" \
  phpMaxFileUploads="${PHP_MAX_FILE_UPLOADS}" \
  phpDateTimezone="${PHP_DATE_TIMEZONE}" \
  phpOpcacheEnable="${PHP_OPCACHE_ENABLE}" \
  phpOpcacheEnableCli="${PHP_OPCACHE_ENABLE_CLI}" \
  phpOpcacheMemoryConsumption="${PHP_OPCACHE_MEMORY_CONSUMPTION}" \
  phpOpcacheInternedStringsBuffer="${PHP_OPCACHE_INTERNED_STRINGS_BUFFER}" \
  phpOpcacheMaxAcceleratedFiles="${PHP_OPCACHE_MAX_ACCELERATED_FILES}" \
  phpOpcacheValidateTimestamps="${PHP_OPCACHE_VALIDATE_TIMESTAMPS}" \
  phpOpcacheSaveComments="${PHP_OPCACHE_SAVE_COMMENTS}" > "${PHP_INI_DIR}/conf.d/zzz-php.ini"

if [ "${INIT_DEBUG}" -ge "3" ]; then
    echodt "DEBUG: print generated php.ini"
    cat "${PHP_INI_DIR}/conf.d/zzz-php.ini"
fi
