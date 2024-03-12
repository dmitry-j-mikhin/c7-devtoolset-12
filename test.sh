#!/bin/bash

set -ex
set -- ${1:-bash} ${@:2:$#}

[ -n "$CI_JOB_TOKEN" ] || TTY="-t"

docker run -i $TTY --rm \
 -e MY_USERNAME=$(id -u -n) \
 -e MY_GROUP=$(id -g -n) \
 -e MY_UID=$(id -u) \
 -e MY_GID=$(id -g) \
 -e CI_JOB_TOKEN=$CI_JOB_TOKEN \
 -v $(readlink -f $SSH_AUTH_SOCK):/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent \
 -v $(realpath .):/test \
 docker.io/dmikhin/c7-devtoolset-12:latest "$@"
