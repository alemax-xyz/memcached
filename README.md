## Memcached docker image
Memcached optimizes specific high-load serving applications that are designed to take advantage of its versatile no-locking memory access system.

This image is based on official memcached package for Ubuntu Bionic and is built on top of [clover/base](https://hub.docker.com/r/clover/base/).

### Environment variables

| Environment                        | Default value                                      | Description
| ---------------------------------- | -------------------------------------------------- | -----------
| `MEMCACHED_TCP_PORT`               | `11211`                                            | TCP port to listen on
| `MEMCACHED_UDP_PORT`               | `11211`                                            | UDP port to listen on (0 is off)
| `MEMCACHED_ENABLE_SHUTDOWN`        | not set                                            | Enable `shutdown` command
| `MEMCACHED_MEMORY_LIMIT`           | `64`                                               | Item memory in megabytes
| `MEMCACHED_DISABLE_EVICTIONS`      | not set                                            | Return error on memory exhausted instead of evicting
| `MEMCACHED_CONN_LIMIT`             | `1024`                                             | Max simultaneous connections
| `MEMCACHED_VERBOSE`                | not set                                            | Verbosity level `1`, `2` or `3`
| `MEMCACHED_SLAB_GROWTH_FACTOR`     | `1.25`                                             | Chunk size growth factor
| `MEMCACHED_SLAB_MIN_SIZE`          | `48`                                               | Min space used for key+value+flags in bytes
| `MEMCACHED_ENABLE_LARGEPAGES`      | not set                                            | Try to use large memory pages (if available)
| `MEMCACHED_THREADS`                | `4`                                                | Number of threads to use
| `MEMCACHED_MAX_REQS_PER_EVENT`     | `20`                                               | Maximum number of requests per event, limits the requests processed per connection to prevent starvation
| `MEMCACHED_DISABLE_CAS`            | not set                                            | Disable use of `CAS` (compare-and-swap)
| `MEMCACHED_LISTEN_BACKLOG`         | `1024`                                             | Set the backlog queue limit
| `MEMCACHED_PROTOCOL`               | `auto`                                             | Protocol, one of the `ascii`, `binary` or `auto`
| `MEMCACHED_MAX_ITEM_SIZE`          | `1mb`                                              | Adjusts max item size (min: 1k, max: 128m)
| `MEMCACHED_ENABLE_SASL`            | not set                                            | Turn on Sasl authentication
| `MEMCACHED_DISABLE_FLUSH_ALL`      | not set                                            | Disable `flush_all` command
| `MEMCACHED_DISABLE_DUMPING`        | not set                                            | Disable `stats cachedump` and `lru_crawler metadump`
| `MEMCACHED_EXTENDED`               | not set                                            | Comma separated list of extended options, most options have a 'no_' prefix to disable, see `memcached --help` for a list of available options
