# Example php-fpm + nginx

This example show, how to use `whalesome` in Dockerfiles and run like rootless (main php and nginx process run 
defined user `RUN_AS`) and how set `docker-compose.yml` with drop most capabilities

For test it:
```shell
docker compose up -d
```
