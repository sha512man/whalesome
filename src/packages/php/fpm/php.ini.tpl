[PHP]
url_rewriter.tags = "a=href,area=href,frame=src,input=src,form=fakeentry"
serialize_precision = 17
expose_php = Off
max_execution_time = {{ or .phpMaxExecutionTime "30" }}
max_input_time = {{ or .phpMaxInputTime "60" }}
memory_limit = {{ or .phpMemoryLimit "128M" }}
error_reporting = {{ or .phpErrorReporting "E_ALL & ~E_DEPRECATED & ~E_STRICT" }}
display_errors = {{ or .phpErrorLogDir "/dev/stderr" }}
display_startup_errors = On
log_errors_max_len = 1024
track_errors = Off
html_errors = Off
error_log = {{ or .phpErrorLogDir "/dev/stderr" }}
variables_order = "EGPCS"
post_max_size = {{ or .phpPostMaxSize "21M" }}
doc_root = {{ or .phpRootDir "/var/www/public" }}
user_dir = {{ or .phpRootDir "/var/www/public" }}
upload_max_filesize = {{ or .phpUploadMaxFilesize "21M" }}
max_file_uploads = {{ or .phpMaxFileUploads "21M" }}
daemonize = no

[Date]
date.timezone= {{ or .phpDateTimezone "Europe/Prague" }}

[Pdo_mysql]
pdo_mysql.cache_size = 2000

[mail function]
mail.add_x_header = On

[SQL]
sql.safe_mode = Off

[ODBC]
odbc.defaultbinmode = 1

[Interbase]
ibase.allow_persistent = 1
ibase.max_persistent = -1
ibase.max_links = -1
ibase.timestampformat = "%Y-%m-%d %H:%M:%S"
ibase.dateformat = "%Y-%m-%d"
ibase.timeformat = "%H:%M:%S"

[MySQLi]
mysqli.cache_size = 2000
mysqli.reconnect = Off

[Session]
session.hash_function = 0
session.hash_bits_per_character = 5

[Assertion]
zend.assertions = 1

[mbstring]
mbstring.language="Czech"

[opcache]
opcache.enable = {{ or .phpOpcacheEnable "On" }}
opcache.enable_cli = {{ or .phpOpcacheEnableCli "Off" }}
opcache.memory_consumption = {{ or .phpOpcacheMemoryConsumption "128" }}
opcache.interned_strings_buffer = {{ or .phpOpcacheInternedStringsBuffer "32" }}
opcache.max_accelerated_files = {{ or .phpOpcacheMaxAcceleratedFiles "32531" }}
opcache.validate_timestamps = {{ or .phpOpcacheValidateTimestamps "Off" }}
opcache.save_comments = {{ or .phpOpcacheSaveComments "Off" }}
opcache.jit = {{ or .phpOpcacheJit "tracing" }}
opcache.jit_buffer_size = {{ or .phpOpcacheJitBufferSize "128M" }}
opcache.error_log = {{ or .phpErrorLogDir "/dev/stderr" }}
