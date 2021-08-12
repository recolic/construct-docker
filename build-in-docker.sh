# image: ubuntu:20.04

# build time
apt install -y autoconf autoconf-archive autoconf2.13 automake autotools-dev libboost1.71-all-dev build-essential git libbz2-dev libmagic-dev libnss-db libsodium-dev libssl-dev libtool shtool xz-utils libgraphicsmagick1-dev libgraphicsmagick-q16-3 libpng-dev libicu-dev libjemalloc-dev liblz4-dev libzstd-dev librocksdb-dev clang llvm-dev

git clone https://github.com/matrix-construct/construct
cd construct
./autogen.sh
./configure --with-included-rocksdb=v6.12.7
make -j$(nproc)
make install DESTDIR=/fakeroot
cp ./deps/rocksdb/librocksdb.so* /fakeroot/usr/lib/
strip --strip-debug /fakeroot/usr/lib/*.so*
cd /fakeroot && tar -cvzf construct-pkg.tar.gz usr



