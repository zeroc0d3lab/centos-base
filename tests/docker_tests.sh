#!/usr/bin/env bash

DOCKER_IMAGE="zeroc0d3/centos-base"
DOCKER_TAG="latest"

#### Halt script on error
set -e

echo '##### Print docker version'
docker --version

echo '##### Print environment'
env | sort

echo "FROM ${DOCKER_IMAGE}:${DOCKER_TAG}" > Dockerfile.test &&
echo "ONBUILD RUN ["exit"]" >> Dockerfile.test &&
docker build --no-cache -t "${DOCKER_IMAGE}:${DOCKER_TAG}-test" -f Dockerfile.test . &&
docker run -it $(pwd)/tests/results:/var/tests/results "${DOCKER_IMAGE}:${DOCKER_TAG}-test" /bin/bash &&
rm Dockerfile.test
