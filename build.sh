#!/usr/bin/env bash
set -xe

BUILDROOT_VERSION="2019.05.3"

# Use the first argument as config name
# Default to "norns_defconfig" if no argument given
CONFIG=${1:-norns_defconfig}

# Make sure the Docker image is up to date
docker pull "simonvanderveldt/buildroot:${BUILDROOT_VERSION}"

# Run the build
docker run --rm -ti \
  -v "${HOME}/.cache/buildroot-downloads":/buildroot/dl \
  -v "${HOME}/.cache/buildroot-ccache":/root/.buildroot-ccache \
  -v "${PWD}":/mycustombuildroot \
  -v "${PWD}/output/images":/buildroot/output/images \
  -v "${PWD}/output/graphs":/buildroot/output/graphs \
  -e BR2_EXTERNAL=/mycustombuildroot \
  -e BR2_GRAPH_OUT=png \
  "simonvanderveldt/buildroot:${BUILDROOT_VERSION}" \
  sh -c "make ${CONFIG} \
    && make \
    && BR2_GRAPH_DEPS_OPTS='--exclude host' make graph-depends \
    && mv output/graphs/graph-depends.dot output/graphs/graph-depends-target.dot \
    && mv output/graphs/graph-depends.png output/graphs/graph-depends-target.png \
    && make graph-depends \
    && make graph-build \
    && make graph-size"
