#!/bin/bash
set -e

BOARD_DIR="$(dirname $0)"

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
