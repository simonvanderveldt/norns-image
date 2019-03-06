#!/usr/bin/env bash
set -xe

# Make sure the Docker image is up to date
docker pull simonvanderveldt/buildroot:2018.11.3

# Run the build
docker run --rm -ti \
  -v "${HOME}/.cache/buildroot-downloads":/buildroot/dl \
  -v "${HOME}/.cache/buildroot-ccache":/root/.buildroot-ccache \
  -v "${PWD}":/mycustombuildroot \
  -v "${PWD}/output/images":/buildroot/output/images \
  -v "${PWD}/output/graphs":/buildroot/output/graphs \
  -e BR2_EXTERNAL=/mycustombuildroot \
  -e BR2_GRAPH_OUT=png \
  simonvanderveldt/buildroot:2018.11.3 \
  sh -c 'make norns_defconfig \
    && make \
    && BR2_GRAPH_DEPS_OPTS="--exclude host" make graph-depends \
    && mv output/graphs/graph-depends.dot output/graphs/graph-depends-target.dot \
    && mv output/graphs/graph-depends.png output/graphs/graph-depends-target.png \
    && make graph-depends \
    && make graph-build \
    && make graph-size'
