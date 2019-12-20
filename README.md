# Norns image [![CircleCI](https://circleci.com/gh/simonvanderveldt/norns-image.svg?style=svg)](https://circleci.com/gh/simonvanderveldt/norns-image)

## Dependencies
- Docker

## How to use

### Building the image
The built images are hardware specific. The following hardware is supported:

| Device                                                                     | How to build                              | Image location                         |
|----------------------------------------------------------------------------|-------------------------------------------|----------------------------------------|
| Norns                                                                      | `./build.sh`                              | `output/images/norns.img`              |
| Raspberry Pi 3 with [norns-shield](https://github.com/monome/norns-shield) | `./build.sh norns_raspberrypi3_defconfig` | `output/images/norns-raspberrypi3.img` |

The build script will start a container which will automatically build the image.
Note that two caching directories will be created in your user's home directory:
- `~/.cache/buildroot-downloads`: Buildroot's package download cache
- `~/.cache/buildroot-ccache`: Buildroot's compiler cache

### Interactive building
```bash
# Make sure the image is up to date
$ docker pull simonvanderveldt/buildroot:2019.08.3

# Start the container
$ docker run --rm -ti \
  -v "${HOME}/.cache/buildroot-downloads":/buildroot/dl \
  -v "${HOME}/.cache/buildroot-ccache":/root/.buildroot-ccache \
  -v "${PWD}":/mycustombuildroot \
  -v "${PWD}/output/images":/buildroot/output/images \
  -v "${PWD}/output/graphs":/buildroot/output/graphs \
  -e BR2_EXTERNAL=/mycustombuildroot \
  -e BR2_GRAPH_OUT=png \
  simonvanderveldt/buildroot:2019.08.3

# You're now inside a shell in the buildroot container
# You can run any normal buildroot command here
root@97b9c44b0e3d:/buildroot# make norns_defconfig
# ...
root@97b9c44b0e3d:/buildroot# make menuconfig
# etc
```
