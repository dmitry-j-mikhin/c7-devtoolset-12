set -ex

docker build --pull \
 --tag dmikhin/c7-devtoolset-12:musl .
docker push dmikhin/c7-devtoolset-12:musl