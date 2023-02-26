set -ex

docker build --pull \
 --tag dmikhin/c7-devtoolset-12:aarch64 .
docker push dmikhin/c7-devtoolset-12:aarch64