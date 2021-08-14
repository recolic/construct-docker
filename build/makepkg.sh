#!/bin/bash
# image: ubuntu:20.04

function build-in-docker () {
    # build time dependencies
    apt update && DEBIAN_FRONTEND="noninteractive" apt install -y autoconf autoconf-archive autoconf2.13 automake autotools-dev libboost1.71-all-dev build-essential git libbz2-dev libmagic-dev libnss-db libsodium-dev libssl-dev libtool shtool xz-utils libgraphicsmagick1-dev libgraphicsmagick-q16-3 libpng-dev libicu-dev libjemalloc-dev liblz4-dev libzstd-dev librocksdb-dev clang llvm-dev &&
    git clone https://github.com/matrix-construct/construct &&
    cd construct &&
    ./autogen.sh &&
    ./configure --with-included-rocksdb=v6.12.7 &&
    make -j$(nproc) &&
    make install DESTDIR=/fakeroot &&
    cp ./deps/rocksdb/librocksdb.so* /fakeroot/usr/lib/ &&
    strip --strip-debug /fakeroot/usr/lib/*.so* &&
    cd /fakeroot && tar -cvzf construct-pkg.tar.gz usr

    exit $?
}

function build-host () {
    docker run -ti -v $(pwd):/build ubuntu:20.04 bash -c 'cd / && /build/build.sh in-docker && mv /fakeroot/construct-pkg.tar.gz /build/'

    exit $?
}

[[ "$1" = in-docker ]] && build-in-docker
[[ "$1" != in-docker ]] && build-host

