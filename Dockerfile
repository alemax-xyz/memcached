FROM library/debian:stable-slim AS build

ENV LANG=C.UTF-8 \
    SANDBOX_ROOT=/

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y wget openssl ca-certificates

ADD https://github.com/alemax-xyz/misc-tools.git#main /usr/local/bin/

RUN mkdir -p /build /rootfs

WORKDIR /build

COPY build/ .

COPY --from=clover/base:latest /var/lib/packages/ var/lib/packages/

RUN apt-sandbox --install --verstamp \
        --apt-config \
            APT::Install-Recommends=false \
            APT::Get::Upgrade==false \
        --repository . \
        --keyring . \
        --installed var/lib/packages \
        --obsolete packages.obsolete \
        --required packages.required

WORKDIR /rootfs

RUN rm -rf \
        etc \
        lib \
        usr/include \
        usr/lib/tmpfiles.d \
        usr/share

COPY rootfs/ .

FROM clover/base

ENV LANG=C.UTF-8 \
    MEMCACHED_TCP_PORT=11211 \
    MEMCACHED_UDP_PORT=11211

COPY --from=build /rootfs /

EXPOSE ${MEMCACHED_TCP_PORT:-11211}/tcp ${MEMCACHED_UDP_PORT:-11211}/udp
