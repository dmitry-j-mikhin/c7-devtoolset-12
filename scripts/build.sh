#!/bin/bash

set -ex

echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf
echo "fastestmirror=True" >> /etc/dnf/dnf.conf

dnf install -y gcc g++ make cmake autoconf automake libtool bison flex sudo git \
 tcl `#sqlite` \
 CUnit-devel libuuid-devel `#libwacl` \
 re2c `#libdetection` \
 texinfo `#libconfig` \
 valgrind-devel `#gperftools` \
 openssl-devel `#libproton` \
 libstdc++-static pcre-devel \
 perl-Test-Harness perl-Test-Simple perl-Time-HiRes \
 perl-JSON-XS perl-IO-Compress-Zlib perl-Proc-ProcessTable \
 perl-TimeDate perl-URI perl-Protocol-WebSocket perl-DBI perl-DBD-SQLite \
 perl-Net-IP perl-FindBin ruby rubygem-msgpack \
 ruby-devel lcov \
 tcl-devel diffutils which rubygem-rspec \
 readline-devel ncurses-devel libicu-devel libunwind-devel \
 python3.11-devel

echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/wheel_group
echo 'Defaults:%wheel !requiretty' >> /etc/sudoers.d/wheel_group

mv -v /usr/bin/install /usr/bin/install-real
cp -v /build/install /usr/bin/install
cp -v /build/entrypoint.sh /usr/local/bin/entrypoint.sh

dnf -y clean all && rm -rf /var/cache