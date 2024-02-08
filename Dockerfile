# syntax=docker/dockerfile:experimental
FROM fedora:39

# ADD scripts /build
RUN --mount=type=bind,target=/build,source=scripts,ro \
    /build/build.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]