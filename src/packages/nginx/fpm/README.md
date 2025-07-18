# Whalesome package nginx/fpm

Available envs:
- `DISABLE_DNS_CACHE` - Disable dns cache (must provide `DNS_RESOLVER` env)
- `DNS_RESOLVER` - Set manually DNS resolver ip address
- `FPM_HOST` - Set fpm host (default is `php-fpm`)
- `FPM_PING_PATH` - Set fpm ping path @see https://www.php.net/manual/en/install.fpm.configuration.php
- `FPM_PORT` - Set fpm port (default is `9000`)
- `FPM_STATUS_LISTEN_PORT` - Set fpm status port (default is `9000`) @see https://www.php.net/manual/en/install.fpm.configuration.php
- `FPM_STATUS_PATH` - Set fpm status path @see https://www.php.net/manual/en/install.fpm.configuration.php
- `HTTP_ERRORS_DIR` - Set custom errors dir (default is `/opt/whalesome/packages/nginx/fpm/errors` with default errors)
- `INIT_DEBUG` - Show init logs in startup (default is `null`, possible values is `1, 2, 3`)
- `NGINX_PROCESS_USER` - Set custom process user (default is `www-data`)
- `NGINX_ROOT_DIR` - Set custom nginx root dir (default is `/var/www/public`)
- `RUN_AS` - Run main process as defined user (eg. `www-data`)
- `FPM_STATUS_ALLOWED_IPS` - Set allowed IP addresses for the status path @see https://nginx.org/en/docs/http/ngx_http_access_module.html
- `WORKER_CONNECTIONS` - Set custom nginx worker connections (default is `4096`) @see https://nginx.org/en/docs/ngx_core_module.html#worker_connections
- `WORKER_PROCESSES` - Set custom nginx worker processes (default is `auto`) @see https://nginx.org/en/docs/ngx_core_module.html#worker_processes
- `WORKER_RLIMIT_NO_FILE` - Set custom nginx worker rlimit nofile (default is `4096`) @see https://nginx.org/en/docs/ngx_core_module.html#worker_rlimit_nofile
