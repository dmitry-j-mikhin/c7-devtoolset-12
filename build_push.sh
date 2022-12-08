set -ex

#docker build --pull --no-cache --tag dmikhin/c7-devtoolset-12:latest .
docker build \
 --build-arg USER_ID=1000 \
 --build-arg GROUP_ID=1000 \
 --tag dmikhin/c7-devtoolset-12:latest .
docker push dmikhin/c7-devtoolset-12:latest