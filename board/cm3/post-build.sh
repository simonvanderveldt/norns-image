#!/bin/bash
set -e

BOARD_DIR="$(dirname $0)"

# Replace the rpi config.txt file
cp -f ${BOARD_DIR}/config.txt $BINARIES_DIR/rpi-firmware/

# Remove autoenabling of networking
if [ -e ${TARGET_DIR}/etc/init.d/S40network ]; then
   rm ${TARGET_DIR}/etc/init.d/S40network
fi

if [ -e ${TARGET_DIR}/etc/init.d/S05avahi-setup.sh ]; then
    rm ${TARGET_DIR}/etc/init.d/S05avahi-setup.sh
fi

if [ -e ${TARGET_DIR}/etc/init.d/S41dhcpcd ]; then
    rm ${TARGET_DIR}/etc/init.d/S41dhcpcd
fi

if [ -e ${TARGET_DIR}/etc/init.d/S80dnsmasq ]; then
    rm ${TARGET_DIR}/etc/init.d/S80dnsmasq
fi
