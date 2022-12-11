set -ex

docker build --pull \
 --build-arg USER_ID=1012 \
 --build-arg GROUP_ID=1012 \
 --tag dmikhin/c7-devtoolset-12:latest .
docker push dmikhin/c7-devtoolset-12:latest