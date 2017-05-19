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
docker build -t "${DOCKER_IMAGE}:${DOCKER_TAG}-test" -f Dockerfile.test . &&
docker run -it --rm -v $(pwd)/tests/results:/var/tests/results "${DOCKER_IMAGE}:${DOCKER_TAG}-test" &&
docker ps -a
rm Dockerfile.test
