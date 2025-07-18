{{ if .dnsResolver }}
  resolver {{ .dnsResolver }} valid=5s ipv6=off;
  set $fpm_upstream "{{ or .fpmHost "php-fpm" }}:{{ or .fpmPort "9000" }}";
  fastcgi_pass $fpm_upstream;
{{ else }}
  fastcgi_pass {{ or .fpmHost "php-fpm" }}:{{ or .fpmPort "9000" }};
{{ end }}
