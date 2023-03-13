#!/bin/sh

set -ex

apk add --no-cache shadow coreutils bash sudo openssh-client \
 autoconf automake libtool musl-dev make linux-headers \
 gcc cmake git \
 tcl `#sqlite` \
 cunit-dev util-linux-dev `#libwacl` \
 re2c bison bsd-compat-headers `#libdetection` \
 texinfo g++ flex `#libconfig` \
 zlib-dev `#libxml2` \
 valgrind-dev `#gperftools` \
 openssl-dev `#libproton` \
 openssl-libs-static `#libproton proper linking into module` \
 pcre-dev curl grep tar `#nginx`

echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/wheel_group
echo 'Defaults:%wheel !requiretty' >> /etc/sudoers.d/wheel_group

rm /usr/bin/install
ln -f -s /usr/bin/coreutils /tmp/install
cp -v /build/install /usr/bin/install
