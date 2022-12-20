FROM centos:centos7

ADD scripts /build
RUN /build/build.sh

# Environment Configuration
ENV CC=/opt/rh/devtoolset-12/root/usr/bin/gcc \
    CPP=/opt/rh/devtoolset-12/root/usr/bin/cpp \
    CXX=/opt/rh/devtoolset-12/root/usr/bin/g++ \
    PATH=/opt/rh/devtoolset-12/root/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LD_LIBRARY_PATH=/opt/rh/devtoolset-12/root/usr/lib64:/opt/rh/devtoolset-12/root/usr/lib:/opt/rh/devtoolset-12/root/usr/lib64/dyninst:/opt/rh/devtoolset-12/root/usr/lib/dyninst \
    MANPATH=/opt/rh/devtoolset-12/root/usr/share/man \
    PKG_CONFIG_PATH=/opt/rh/devtoolset-12/root/usr/lib64/pkgconfig \
    INFOPATH=/opt/rh/devtoolset-12/root/usr/share/info \
    X_SCLS=devtoolset-12 \
    PCP_DIR=/opt/rh/devtoolset-12/root

ENTRYPOINT ["/build/entrypoint.sh"]