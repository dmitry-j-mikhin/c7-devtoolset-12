FROM alpine:3.14

ADD scripts /build
RUN /build/build.sh

ENTRYPOINT ["/build/entrypoint.sh"]