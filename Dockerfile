FROM centos:centos7

ADD scripts /build
RUN bash /build/build.sh

# Environment Configuration
ENV CC=/opt/rh/devtoolset-12/root/usr/bin/gcc \
    CPP=/opt/rh/devtoolset-12/root/usr/bin/cpp \
    CXX=/opt/rh/devtoolset-12/root/usr/bin/g++ \
    PATH=/opt/rh/devtoolset-12/root/usr/bin:$PATH \
    LD_LIBRARY_PATH=/opt/rh/devtoolset-12/root/usr/lib64:/opt/rh/devtoolset-12/root/usr/lib:/opt/rh/devtoolset-12/root/usr/lib64/dyninst:/opt/rh/devtoolset-12/root/usr/lib/dyninst:/opt/rh/devtoolset-12/root/usr/lib64:/opt/rh/devtoolset-12/root/usr/lib:$LD_LIBRARY_PATH
