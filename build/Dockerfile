FROM ubuntu:20.04

# Runtime dependencies
RUN apt update && DEBIAN_FRONTEND="noninteractive" apt install -y libssl-dev libsodium-dev libjemalloc-dev libicu-dev libmagic-dev libboost-filesystem1.71-dev libboost-coroutine1.71-dev libboost-chrono1.71-dev libnuma1 libnss-db

COPY construct-pkg.tar.gz /
RUN tar xvzf /construct-pkg.tar.gz -C / && rm /construct-pkg.tar.gz


