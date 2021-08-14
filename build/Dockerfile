FROM ubuntu:20.04

RUN apt update && DEBIAN_FRONTEND="noninteractive" apt install -y libboost1.71-all-dev libbz2-dev libmagic-dev libnss-db libsodium-dev libssl-dev libgraphicsmagick1-dev libgraphicsmagick-q16-3 libpng-dev libicu-dev libjemalloc-dev liblz4-dev libzstd-dev
COPY construct-pkg.tar.gz /
RUN tar xvzf /construct-pkg.tar.gz -C / && rm /construct-pkg.tar.gz


