[global]

error_log = {{ or .fpmErrorLogDir "/dev/stderr" }}
daemonize = no

[www]

user = {{ or .fpmRuntimeUser "www-data" }}
group = {{ or .fpmRuntimeGroup "www-data" }}

listen = {{ or .fpmPort "9000" }}

pm = dynamic
pm.max_children = {{ or .fpmPmMaxChildren "15" }}
pm.start_servers = {{ or .fpmPmStartServers "2" }}
pm.min_spare_servers = {{ or .fpmPmMinSpareServers "1" }}
pm.max_spare_servers = {{ or .fpmPmMaxSpareServers "3" }}
{{ if .fpmPingPath }}
ping.path = {{ .fpmPingPath }}
ping.response = pong
{{ end }}
{{ if .fpmStatusPath }}
pm.status_path = {{ .fpmStatusPath }}
{{ end }}
{{ if .fpmStatusListenPort }}
pm.status_listen = {{ .fpmStatusListenPort }}
{{ end }}
access.log = {{ or .fpmAccessLog "/dev/stdout" }}

chdir = {{ or .fpmRootDir "/var/www/public" }}

catch_workers_output = yes

clear_env = no

php_flag[display_errors] = off
php_admin_value[error_log] = {{ or .fpmErrorLogDir "/dev/stderr" }}
php_admin_flag[log_errors] = on
