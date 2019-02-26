# Norns image
Built using [Buildroot](https://buildroot.org/).

Currently needs this patched buildroot fork/branch to work https://github.com/simonvanderveldt/buildroot/tree/2018.11.3-rpi-overlays.

## How to use
```
# Clone or download this repo
# Download and extract buildroot
# Change directory to the extracted buildroot directory
export BR2_EXTERNAL=<path-to-this-repo>
make norns_defconfig
make
dd if=output/images/norns.img of=/dev/<rpi3 drive> bs=4MiB
```

Alternatively use the [`simonvanderveldt/buildroot:2018.11.3`](https://cloud.docker.com/repository/docker/simonvanderveldt/buildroot) docker image which has the same patches applied:
```
# Clone or download this repository
cd norns-image
docker run -ti -e BR2_EXTERNAL=/mycustombuildroot -v `pwd`:/mycustombuildroot simonvanderveldt/buildroot:2018.11.3
```
