# Whalesome

Docker image holding utility scripts for convenient dockerizing.

## Usage

Using tool like `whls install <package>` in Dockerfile.  
List of available packages:  
- `apache/fpm` - prepare [apache](https://httpd.apache.org/) for [PHP-FPM](https://www.php.net/manual/en/install.fpm.php)
- `cli/zsh` - install zsh and [ohmyzsh](https://ohmyz.sh/)
- `nginx/fpm` - prepare [nginx](https://nginx.org/) for [PHP-FPM](https://www.php.net/manual/en/install.fpm.php)
- `nginx/revprox`
- `php/composer` - install [composer](https://getcomposer.org/)
- `php/fpm` - prepare php fpm
- `php/xdebug` - install and prepare [xdebug](https://xdebug.org/)

## Real example

### PHP + Nginx

Look in the folder [examples/php-nginx](./examples/php-nginx), or just try:

```shell
cd examples/php-nginx && docker compose up -d
```

And look [localhost:8000](http://localhost:8000)

## Global variables

- `APP_DIR` - Set custom app dir, _default is `/var/www`_
- `CUSTOM_SCRIPTS_PATH` - Set custom scripts path, _default is `/opt/whalesome/user-init.d`_
- `INIT_DEBUG` - Set 1 to verbose, set 2 to very verbose, set 3 to very very verbose, _default is `0`_
- `INIT_DIR` - Set custom init dir, _default is `/opt/whalesome/init.d`_
- `RUN_AS` - Set user to startup main process (php-fpm, nginx, ...), _default is empty_
- `RUN_CUSTOM_SCRIPTS` - Set 0 to not run custom init scripts, _default is `1`_
- `RUN_INIT_SCRIPTS` - Set 0 to not run init scripts, _default is `1`_
- `USER` - Set user to create user with specific UID, group with specific GUI, homedir and start subprocess, eg: `www-data:501` (on Mac), `www-data:1000` (on Linux),  _default is empty_

## Rootless

Now are prepared these packages:

- `nginx/fpm`
- `php/fpm`

the other packages will be preparing
