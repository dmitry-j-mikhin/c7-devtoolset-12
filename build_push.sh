set -ex

DOCKER_BUILDKIT=1 docker build --pull --no-cache \
 --tag docker.io/dmikhin/c7-devtoolset-12:latest .
docker push docker.io/dmikhin/c7-devtoolset-12:latest
