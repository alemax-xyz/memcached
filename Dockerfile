#
# This is a multi-stage build.
# Actual build is at the very end.
#

FROM library/ubuntu:xenial AS build

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
RUN apt-get update && \
    apt-get install -y \
        python-software-properties \
        software-properties-common \
        apt-utils

RUN mkdir -p /build/image
WORKDIR /build
RUN apt-get download \
        memcached \
        libevent-2.0-5 \
        libsasl2-2 \
        libsasl2-modules-db \
        libdb5.3
RUN for file in *.deb; do dpkg-deb -x ${file} image/; done

WORKDIR /build/image
RUN rm -rf \
        etc \
        lib \
        usr/include \
        usr/share

FROM clover/base

WORKDIR /
COPY --from=build /build/image /

CMD ["memcached", "-u", "root", "-v", "-m", "64", "-c", "1024", "-t", "4", "-I", "1m", "-b", "1024", "-R", "20"]

EXPOSE 11211
