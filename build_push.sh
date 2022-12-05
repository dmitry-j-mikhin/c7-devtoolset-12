set -ex

docker build --pull --no-cache --tag dmikhin/c7-devtoolset-12:latest .
docker push dmikhin/c7-devtoolset-12:latest