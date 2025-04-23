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

In `Dockerfile`:

```dockerfile
FROM sha512man/whalesome

...

COPY --from=sha512man/whalesome /opt/whalesome /opt/whalesome

...

RUN mv /opt/whalesome/bin/* /usr/local/bin \
    && whls install php/fpm
```

And in `docker-compose.yml`:

```yaml
services:
    php:
        build:
            context: .
            target: dev
            dockerfile: ./docker/nginx/Dockerfile
        ports:
            - "8000:80"
        environment:
            USER: "www-data:501"
            RUN_AS: "www-data"
            INIT_DEBUG: "1"
        cap_drop:
            - ALL
        cap_add:
            - SETGID
            - SETUID
            - CHOWN
```

## Global variables

- `APP_DIR` - Set custom app dir, _default is `/var/www`_
- `CUSTOM_SCRIPTS_PATH` - Set custom scripts path, _default is `/opt/whalesome/user-init.d`_
- `INIT_DEBUG` - Set 1 to verbose, set 2 to very verbose, set 3 to very very verbose, _default is `0`_
- `INIT_DIR` - Set custom init dir, _default is `/opt/whalesome/init.d`_
- `RUN_AS` - Set user to startup main process (php-fpm, nginx, ...), _default is empty_
- `RUN_CUSTOM_SCRIPTS` - Set 0 to not run custom init scripts, _default is `1`_
- `RUN_INIT_SCRIPTS` - Set 0 to not run init scripts, _default is `1`_
- `USER` - Set user to create user with specific UID, group with specific GUI, homedir and start subprocess, eg: `www-data:501` (on Mac), `www-data:1000` (on Linux),  _default is empty_

