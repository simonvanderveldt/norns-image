#!/bin/bash
set -e

BOARD_DIR="$(dirname $0)"

# Fix for buildroot adding an unnecessary default (console-|serial-)getty@.service
# Systemd will automatically pick up the kernel's console=<console> parameter and create
# serial-console@<console>.service
# Having an additional one makes no sense and depending on the value of
# BR2_TARGET_GENERIC_GETTY_PORT breaks things
rm -rf ${TARGET_DIR}/etc/systemd/system/getty.target.wants/

# Rename dt-blob.dtb to dt-blob.bin
if [ -f ${BINARIES_DIR}/dt-blob.dtb ]; then
  mv "${BINARIES_DIR}/dt-blob.dtb" "${BINARIES_DIR}/dt-blob.bin"
fi

# Use our custom cmdline.txt and config.txt
if [ -f ${BOARD_DIR}/cmdline.txt ]; then
  cp -f ${BOARD_DIR}/cmdline.txt $BINARIES_DIR/
fi
if [ -f ${BOARD_DIR}/config.txt ]; then
  cp -f ${BOARD_DIR}/config.txt $BINARIES_DIR/
fi

# Remove /etc/resolv.conf from skeleton
# When there's an existing file NetworkManager won't update it
rm -f ${TARGET_DIR}/etc/resolv.conf

# Enable norns.target
ln -fs ../norns.target \
		${TARGET_DIR}/etc/systemd/system/multi-user.target.wants/norns.target

# Enable maiden socket activation
# This is the equivalent of "systemctl enable norns-maiden.socket"
mkdir -p ${TARGET_DIR}/etc/systemd/system/sockets.target.wants
ln -fs ../norns-maiden.socket \
    ${TARGET_DIR}/etc/systemd/system/sockets.target.wants/norns-maiden.socket
