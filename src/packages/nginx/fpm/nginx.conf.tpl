user {{ or .nginxProcessUser "www-data" }} {{ or .nginxProcessUser "www-data" }};
worker_processes {{ or .workerProcesses "auto" }};

error_log /dev/stderr;

pid /tmp/nginx.pid;

worker_rlimit_nofile {{ if .workerRlimitNoFile }}{{ .workerRlimitNoFile }}{{ else }}{{ .defaultConnections }}{{ end }};

daemon off;

events {
  use epoll;
  worker_connections {{ if .workerConnections }}{{ .workerConnections }}{{ else }}{{ .defaultConnections }}{{ end }};
  multi_accept on;
}

http {
  include mime.types;
  default_type application/octet-stream;

  log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                    '$status $body_bytes_sent "$http_referer" '
                    '"$http_user_agent" "$http_x_forwarded_for"';

  access_log  /dev/stdout;

  client_max_body_size 100m;
  sendfile on;

  keepalive_timeout 120;
  gzip on;

  server {
    server_name _;
    listen 80;

    access_log /dev/stdout;
    error_log /dev/stderr;

    root {{ or .nginxRootDir "/var/www/public" }};
    index  index.php index.html index.htm;

    location / {
      try_files $uri $uri/ /index.php?$args;
    }

    location ~* ^.+\.(css|js|jpg|jpeg|gif|png|ico|gz|svg|svgz|ttf|otf|woff|eot|mp4|ogg|ogv|webm)$ {
      expires max;
      access_log off;
    }

    error_page   404  /404.html;
    error_page   403  /403.html;
    error_page   500  /500.html;
    error_page   502  /502.html;
    error_page   503  /503.html;
    error_page   504  /504.html;

    location ~ /(500|502|503|504|404|403).html$ {
      root {{ .httpErrorsDir }};
    }

    {{- if .fpmPingPath }}
    location = {{ .fpmPingPath }} {
      include fastcgi_resolver;
      include fastcgi.conf;
    }
    {{- end }}

    {{- if .fpmStatusPath }}
    location = {{ .fpmStatusPath }} {
      include fastcgi_resolver;
      include fastcgi.conf;

      {{- if .fpmStatusAllowedIps }}
      allow {{ .fpmStatusAllowedIps }};
      {{- end }}

      deny all;
    }
    {{- end }}

    location ~ \.php$ {
      fastcgi_index  index.php;

      include fastcgi_resolver;
      include fastcgi.conf;
    }
  }
}
