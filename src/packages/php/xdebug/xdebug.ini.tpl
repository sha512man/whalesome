[xdebug]
zend_extension={{ or .xdebugExtensionPath "xdebug.so" }}

xdebug.mode={{ or .xdebugMode "debug" }}
xdebug.start_with_request={{ or .xdebugStartWithRequest "yes" }}
xdebug.client_host={{ .xdebugClientHost }}
xdebug.client_port={{ or .xdebugClientPort "9000" }}
xdebug.remote_handler={{ or .xdebugRemoteHandler "dbgp" }}
xdebug.remote_connect_back={{ or .xdebugConnectBack "0" }}
xdebug.output_dir={{ or .xdebugOutputDir "/tmp" }}
xdebug.idekey={{ or .xdebugIdekey "docker" }}
xdebug.profiler_output_name={{ or .xdebugProfilerOutputName "cachegrind.out.%p-%H-%R" }}
