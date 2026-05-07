## Memcached docker image

Memcached optimizes specific high-load serving applications that are designed to take advantage of its versatile no-locking memory access system.

This image is based on official memcached package for debian and is built on top of [clover/base](https://hub.docker.com/r/clover/base/).

### Exposed ports

| Port | Description
| ---- | -----------
| `22122` | TCP/UDP port _memcached_ is listening on

### Environment variables

| Environment | Default value | Description
| ----------- | ------------- | -----------
| `PUID` | _not set_ | desired user id of the process owner
| `PGID` | _not set_ | desired group id of the process pwner (primary group of the `PUID` user)
| `PUSER` | _not set_ | desired `PUID` user name
| `PGROUP` | _not set_ | desired `PGID` group name
| `CHOWN` | _not set_ | space-separated list of directories to change ownership to `PUID`/`PGID` during container startup
| `CRON` | _not set_ (`0`) | will start _cron_ inside the container if set to `1`
| `MEMCACHED_TCP_PORT` | `11211` | TCP port to listen on
| `MEMCACHED_UDP_PORT` | `11211` | UDP port to listen on (`0` is off)
| `MEMCACHED_UNIX_SOCKET` | _not set_ | UNIX socket to listen on (disables network support)
| `MEMCACHED_UNIX_MASK` | _not set_ | access mask for UNIX socket, in octal (default: `700`)
| `MEMCACHED_ENABLE_SHUTDOWN` | _not set_ | Enable `shutdown` command
| `MEMCACHED_LISTEN` | _not set_ | space-separated list of interface(s) to listen on (default: INADDR_ANY); if TLS/SSL is enabled, `notls` prefix can be used to disable for specific listeners (`notls:<ip>:<port>`)
| `MEMCACHED_ENABLE_COREDUMPS` | _not set_ | maximize core file limit
| `MEMCACHED_MEMORY_LIMIT` | _not set_ (`64`) | Item memory in megabytes
| `MEMCACHED_DISABLE_EVICTIONS` | _not set_ | Return error on memory exhausted instead of evicting
| `MEMCACHED_CONN_LIMIT` | _not set_ (`1024`) | Max simultaneous connections
| `MEMCACHED_LOCK_MEMORY` | _not set_ | lock down all paged memory
| `MEMCACHED_VERBOSE` | _not set_ | Verbosity level `1`, `2` or `3`
| `MEMCACHED_SLAB_GROWTH_FACTOR` | _not set_ (`1.25`) | Chunk size growth factor
| `MEMCACHED_SLAB_MIN_SIZE` | _not set_ (`48`) | Min space used for key+value+flags in bytes
| `MEMCACHED_ENABLE_LARGEPAGES` | _not set_ | Try to use large memory pages (if available)
| `MEMCACHED_THREADS` | _not set_ (`4`) | Number of threads to use
| `MEMCACHED_MAX_REQS_PER_EVENT` | _not set_ (`20`) | Maximum number of requests per event, limits the requests processed per connection to prevent starvation
| `MEMCACHED_DISABLE_CAS` | _not set_ | Disable use of `CAS` (compare-and-swap)
| `MEMCACHED_LISTEN_BACKLOG` | _not set_ (`1024`) | Set the backlog queue limit
| `MEMCACHED_PROTOCOL` | _not set_ (`auto`) | Protocol, one of the `ascii`, `binary` or `auto`
| `MEMCACHED_MAX_ITEM_SIZE` | _not set_ (`1mb`) | Adjusts max item size (min: 1k, max: 128m)
| `MEMCACHED_ENABLE_SASL` | _not set_ | Turn on Sasl authentication
| `MEMCACHED_DISABLE_FLUSH_ALL` | _not set_ | Disable `flush_all` command
| `MEMCACHED_DISABLE_DUMPING` | _not set_ | Disable `stats cachedump` and `lru_crawler metadump`
| `MEMCACHED_DISABLE_WATCH` | _not set_ | disable watch commands (live logging)
| `MEMCACHED_AUTH_FILE` | _not set_ | (EXPERIMENTAL) enable ASCII protocol authentication; file format: `user:pass{\n}user2:pass2{\n}`
| `MEMCACHED_MEMORY_FILE` | _not set_ |  (EXPERIMENTAL) mmap a file for item memory; use only in ram disks or persistent memory mounts! enables restartable cache (stop with `SIGUSR1`)
| `MEMCACHED_ENABLE_SSL` | _not set_ | enable TLS/SSL; use `MEMCACHED_EXTENDED` options to pass `ssl_*`-related parameters
| `MEMCACHED_EXTENDED` | _not set_ | Comma separated list of extended options, most options have a 'no_' prefix to disable, see `memcached --help` for a list of available options
| `MEMCACHED_NAPI_IDS` | _not set_ | number of napi ids. see doc/napi_ids.txt for more details
