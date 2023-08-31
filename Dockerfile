# syntax=docker/dockerfile:experimental
FROM alpine:3.18.3

# ADD scripts /build
RUN --mount=type=bind,target=/build,source=scripts,ro \
    /build/build.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
