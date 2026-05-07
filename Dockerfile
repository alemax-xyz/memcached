FROM library/debian:stable-slim AS build

ENV LANG=C.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update

RUN mkdir -p /build /rootfs
WORKDIR /build
RUN apt-get download \
        memcached \
        libevent-2.1-7t64 \
        libsasl2-2 \
        libsasl2-modules-db
RUN find *.deb | xargs -I % dpkg-deb -x % /rootfs

WORKDIR /rootfs
RUN rm -rf \
        etc \
        lib \
        usr/include \
        usr/lib/tmpfiles.d \
        usr/share

COPY etc/ etc/

WORKDIR /


FROM clover/base

ENV LANG=C.UTF-8 \
    MEMCACHED_TCP_PORT=11211 \
    MEMCACHED_UDP_PORT=11211

COPY --from=build /rootfs /

EXPOSE ${MEMCACHED_TCP_PORT:-11211}/tcp ${MEMCACHED_UDP_PORT:-11211}/udp
