# CentOS Docker (Base Container)
[![Build Status](https://travis-ci.org/zeroc0d3lab/centos-base.svg?branch=master)](https://travis-ci.org/zeroc0d3lab/centos-base) [![](https://images.microbadger.com/badges/image/zeroc0d3lab/centos-base.svg)](https://microbadger.com/images/zeroc0d3lab/centos-base "Layers") [![](https://images.microbadger.com/badges/version/zeroc0d3lab/centos-base.svg)](https://microbadger.com/images/zeroc0d3lab/centos-base "Version") [![GitHub issues](https://img.shields.io/github/issues/zeroc0d3lab/centos-base.svg)](https://github.com/zeroc0d3lab/centos-base/issues) [![GitHub forks](https://img.shields.io/github/forks/zeroc0d3lab/centos-base.svg)](https://github.com/zeroc0d3lab/centos-base/network) [![GitHub stars](https://img.shields.io/github/stars/zeroc0d3lab/centos-base.svg)](https://github.com/zeroc0d3lab/centos-base/stargazers) [![GitHub license](https://img.shields.io/badge/license-GPLv2-blue.svg)](https://raw.githubusercontent.com/zeroc0d3lab/centos-base/master/LICENSE)

## Docker Compose
* Copy `env-example` to `.env`
* Build & running
  ```
  docker-compose build && docker-compose up
  ```
* Force recreate container
  ```
  docker-compose build && docker-compose up --force-recreate base
  ```
* Running container only
  ```
  docker-compose up
  ```

## Environments
You can run docker-compose for different environment with selected containers
* Copy `env.sh.example` to `env.sh`
* Change to execute script
  ```
  chmod a+x env.sh
  ```
* Change environment in `env.sh` file
  ```
  ENV="development"            # (use: "development" or "production" as selected environment)
  CONTAINER_PRODUCTION="..."   # (selected containers will be run in production environment)
  CONTAINER_DEVELOPMENT="..."  # (selected containers will be run in development environment)
  ```
* Running script
  ```
  ./env.sh
  ```

## License
[**GNU General Public License v2**](https://github.com/zeroc0d3lab/centos-base/blob/master/LICENSE)