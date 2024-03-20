user  {{ or .userName "nginx" }};
worker_processes  auto;

error_log  /var/log/nginx/error.log notice;
pid        /var/run/nginx.pid;

events {
  worker_connections  1024;
}

http {
  include       /etc/nginx/mime.types;
  default_type  application/octet-stream;

  log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                    '$status $body_bytes_sent "$http_referer" '
                    '"$http_user_agent" "$http_x_forwarded_for"';

  access_log  /var/log/nginx/access.log  main;

  sendfile        on;
  keepalive_timeout  65;

  {{ if eq .proxySplit "1" }}
    geo $service_account {
        default         0;
        192.0.2.0/24    1;
        198.51.100.0/24 1;
        203.0.113.0/24  1;
        2001:db8::/32   1;
    }
  {{ end }}

  server {
    listen       80;
    server_name  localhost;

    {{ if eq .maintenanceEnabled "1" }}
      location / {
        root   /usr/share/nginx/maintenance;
        try_files $uri $uri/ /index.html;
      }
    {{ else }}
      location / {
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $schema;

        {{ if eq .canaryEnabled }}
          
        {{ else }}

        {{ end }}
      }
    {{ end }}
  }
}
