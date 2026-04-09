#!/bin/sh

exec memcached \
	--port=${MEMCACHED_TCP_PORT:-11211} \
	--udp-port=${MEMCACHED_UDP_PORT:-11211} \
	${MEMCACHED_ENABLE_SHUTDOWN:+--enable-shutdown} \
	--memory-limit=${MEMCACHED_MEMORY_LIMIT:-64} \
	--user=root \
	${MEMCACHED_DISABLE_EVICTIONS:+--disable-evictions} \
	--conn-limit=${MEMCACHED_CONN_LIMIT:-1024} \
	${MEMCACHED_LOCK_MEMORY:+--lock-memory} \
	$(test "${MEMCACHED_VERBOSE}" = 1 && echo --verbose) \
	$(test "${MEMCACHED_VERBOSE}" = 2 && echo -vv) \
	$(test "${MEMCACHED_VERBOSE}" = 3 && echo -vvv) \
	--slab-growth-factor=${MEMCACHED_SLAB_GROWTH_FACTOR:-1.25} \
	--slab-min-size=${MEMCACHED_SLAB_MIN_SIZE:-48} \
	${MEMCACHED_ENABLE_LARGEPAGES:+--enable-largepages} \
	--threads=${MEMCACHED_THREADS:-4} \
	--max-reqs-per-event=${MEMCACHED_MAX_REQS_PER_EVENT:-20}
	${MEMCACHED_DISABLE_CAS:+--disable-cas} \
	--listen-backlog=${MEMCACHED_LISTEN_BACKLOG:-1024} \
	--protocol=${MEMCACHED_PROTOCOL:-auto} \
	--max-item-size=${MEMCACHED_MAX_ITEM_SIZE:-1mb} \
	${MEMCACHED_ENABLE_SASL:+--enable-sasl} \
	${MEMCACHED_DISABLE_FLUSH_ALL:+--disable-flush-all} \
	${MEMCACHED_DISABLE_DUMPING:+--disable-dumping} \
	$(test -n "${MEMCACHED_EXTENDED}" && echo --extended "${MEMCACHED_EXTENDED}")
