set -- memcached \
	--port="${MEMCACHED_TCP_PORT:-11211}" \
	--udp-port="${MEMCACHED_UDP_PORT:-11211}" \
	--user="$PUSER"
[ -n "$MEMCACHED_UNIX_SOCKET" ] && set -- "$@" --unix-socket="$MEMCACHED_UNIX_SOCKET"
[ -n "$MEMCACHED_UNIX_MASK" ] && set -- "$@" --unix-mask="$MEMCACHED_UNIX_MASK"
[ "$MEMCACHED_ENABLE_SHUTDOWN" = 1 ] && set -- "$@" --enable-shutdown
for OPTION in $MEMCACHED_LISTEN; do set -- "$@" --listen="$OPTION"; done
[ "$MEMCACHED_ENABLE_COREDUMPS" = 1 ] && set -- "$@" --enable-coredumps
[ -n "$MEMCACHED_MEMORY_LIMIT" ] && set -- "$@" --memory-limit="$MEMCACHED_MEMORY_LIMIT"
[ "$MEMCACHED_DISABLE_EVICTIONS" = 1 ] && set -- "$@" --disable-evictions
[ -n "$MEMCACHED_CONN_LIMIT" ] && set -- "$@" --conn-limit="$MEMCACHED_CONN_LIMIT"
[ "$MEMCACHED_LOCK_MEMORY" = 1 ] && set -- "$@" --lock-memory
[ "$MEMCACHED_VERBOSE" = 1 ] && set -- "$@" --verbose
[ "$MEMCACHED_VERBOSE" = 2 ] && set -- "$@" -vv
[ "$MEMCACHED_VERBOSE" = 3 ] && set -- "$@" -vvv
[ -n "$MEMCACHED_SLAB_GROWTH_FACTOR" ] && set -- "$@" --slab-growth-factor="$MEMCACHED_SLAB_GROWTH_FACTOR"
[ -n "$MEMCACHED_SLAB_MIN_SIZE" ] && set -- "$@" --slab-min-size="$MEMCACHED_SLAB_MIN_SIZE"
[ "$MEMCACHED_ENABLE_LARGEPAGES" = 1 ] && set -- "$@" --enable-largepages
[ -n "$MEMCACHED_DELIMITER_CHAR" ] && set -- "$@" -D "$MEMCACHED_DELIMITER_CHAR"
[ -n "$MEMCACHED_THREADS" ] && set -- "$@" --threads="$MEMCACHED_THREADS"
[ -n "$MEMCACHED_MAX_REQS_PER_EVENT" ] && set -- "$@" --max-reqs-per-event="$MEMCACHED_MAX_REQS_PER_EVENT"
[ "$MEMCACHED_DISABLE_CAS" = 1 ] && set -- "$@" --disable-cas
[ -n "$MEMCACHED_LISTEN_BACKLOG" ] && set -- "$@" --listen-backlog="$MEMCACHED_LISTEN_BACKLOG"
[ -n "$MEMCACHED_PROTOCOL" ] && set -- "$@" --protocol="$MEMCACHED_PROTOCOL"
[ -n "$MEMCACHED_MAX_ITEM_SIZE" ] && set -- "$@" --max-item-size="$MEMCACHED_MAX_ITEM_SIZE"
[ "$MEMCACHED_ENABLE_SASL" = 1 ] && set -- "$@" --enable-sasl
[ "$MEMCACHED_DISABLE_FLUSH_ALL" = 1 ] && set -- "$@" --disable-flush-all
[ "$MEMCACHED_DISABLE_DUMPING" = 1 ] && set -- "$@" --disable-dumping
[ "$MEMCACHED_DISABLE_WATCH" = 1 ] && set -- "$@" --disable-watch
[ -n "$MEMCACHED_AUTH_FILE" ] && set -- "$@" --auth-file="$MEMCACHED_AUTH_FILE"
[ -n "$MEMCACHED_MEMORY_FILE" ] && set -- "$@" --memory-file="$MEMCACHED_MEMORY_FILE"
[ "$MEMCACHED_ENABLE_SSL" = 1 ] && set -- "$@" --enable-ssl
[ -n "$MEMCACHED_EXTENDED" ] && set -- "$@" --extended="$MEMCACHED_EXTENDED"
[ -n "$MEMCACHED_NAPI_IDS" ] && set -- "$@" --napi_ids="$MEMCACHED_NAPI_IDS"

suexec "$@" &
