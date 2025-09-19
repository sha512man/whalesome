# Whalesome package php/fpm

## For PHP ini

These env vars are interpolated into php.ini from php.ini.tpl by init.d/104-interpolate_php_ini_configuration.sh.
Defaults shown are applied when the env var is not provided.

Available envs:
- `PHP_MAX_EXECUTION_TIME` - Sets php.ini max_execution_time in seconds (default: `30`).
- `PHP_MAX_INPUT_TIME` - Sets php.ini max_input_time in seconds (default: `60`).
- `PHP_MEMORY_LIMIT` - Sets php.ini memory_limit (e.g., `128M`, `512M`) (default: `128M`).
- `PHP_ERROR_REPORTING` - Sets php.ini error_reporting (default: `E_ALL & ~E_DEPRECATED & ~E_STRICT`).
- `PHP_ERROR_LOG_DIR` - Where PHP logs errors; used for php.ini error_log and opcache.error_log (default: `/dev/stderr`).
- `PHP_POST_MAX_SIZE` - Sets php.ini post_max_size (default: `21M`).
- `PHP_ROOT_DIR` - Sets php.ini doc_root and user_dir (default: `/var/www/public`).
- `PHP_UPLOAD_MAX_FILESIZE` - Sets php.ini upload_max_filesize (default: `21M`).
- `PHP_MAX_FILE_UPLOADS` - Sets php.ini max_file_uploads (default as in template: `21M`).
- `PHP_DATE_TIMEZONE` - Sets php.ini date.timezone (default: `Europe/Prague`).
- `PHP_OPCACHE_ENABLE` - Sets opcache.enable (default: `On`).
- `PHP_OPCACHE_ENABLE_CLI` - Sets opcache.enable_cli (default: `Off`).
- `PHP_OPCACHE_MEMORY_CONSUMPTION` - Sets opcache.memory_consumption in MB (default: `128`).
- `PHP_OPCACHE_INTERNED_STRINGS_BUFFER` - Sets opcache.interned_strings_buffer in MB (default: `32`).
- `PHP_OPCACHE_MAX_ACCELERATED_FILES` - Sets opcache.max_accelerated_files (default: `32531`).
- `PHP_OPCACHE_VALIDATE_TIMESTAMPS` - Sets opcache.validate_timestamps (default: `Off`).
- `PHP_OPCACHE_SAVE_COMMENTS` - Sets opcache.save_comments (default: `Off`).
- `PHP_OPCACHE_JIT` - Sets opcache.jit strategy (default: `tracing`).
- `PHP_OPCACHE_JIT_BUFFER_SIZE` - Sets opcache.jit_buffer_size (default: `128M`).
- `PHP_INI_DIR` - Target php.ini base directory; whalesome writes to `${PHP_INI_DIR}/conf.d/whalesome-php.ini`.

## For PHP www.conf

These env vars are interpolated into PHP-FPM pool config from www.conf.tpl by init.d/103-interpolate_www_configuration.sh.
Defaults shown are applied when the env var is not provided.

Available envs:
- `FPM_ERROR_LOG_DIR` - Path/stream for FPM error logs; used for global error_log and php_admin_value[error_log] (default: `/dev/stderr`).
- `WWW_USER` - Runtime user for the PHP-FPM pool (default: `www-data`).
- `WWW_GROUP` - Runtime group for the PHP-FPM pool (default: `www-data`).
- `FPM_PORT` - Port (or socket path) for the FPM listen directive (default: `9000`).
- `FPM_PING_PATH` - Enables ping.path and sets its URI; responds with "pong" when configured.
- `FPM_STATUS_PATH` - Enables pm.status_path and sets its URI.
- `FPM_STATUS_LISTEN_PORT` - If set, configures pm.status_listen to a port/address for the status endpoint.
- `FPM_PM_MAX_CHILDREN` - Sets pm.max_children (default: `15`).
- `FPM_PM_START_SERVRES` - Sets pm.start_servers (default: `2`).
- `FPM_PM_MIN_SPARE_SERVRES` - Sets pm.min_spare_servers (default: `1`).
- `FPM_PM_MAX_SPARE_SERVRES` - Sets pm.max_spare_servers (default: `3`).
- `FPM_ACCESS_LOG` - Path/stream for access.log (default: `/dev/stdout`).
- `FPM_ROOT_DIR` - Working directory for the pool via chdir (default: `/var/www/public`).
- `PHP_FPM_CONFIG_DIR` - Target directory where www.conf is written (default in script: `/usr/local/etc/php-fpm.d`).
