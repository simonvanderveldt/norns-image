# Raspbery Pi Compute Module 3 buildroot image

## How to use
Currently needs this buildroot fork/branch to work https://github.com/simonvanderveldt/buildroot/tree/2017.11.2-rpi-overlays

```
export BR2_EXTERNAL=<path-to-this-repo>
make cm3_defconfig
make
dd if=output/images/sdcard.img of=/dev/<rpi3 drive> bs=4MiB
```
