#!/bin/bash
set -e

BOARD_DIR="$(dirname $0)"

# Rename dt-blob.dtb to dt-blob.bin
if [ -f ${BINARIES_DIR}/dt-blob.dtb ]; then
  mv "${BINARIES_DIR}/dt-blob.dtb" "${BINARIES_DIR}/dt-blob.bin"
fi

# Use our custom cmdline.txt and config.txt
cp -f ${BOARD_DIR}/cmdline.txt $BINARIES_DIR/
cp -f ${BOARD_DIR}/config.txt $BINARIES_DIR/

# Enable norns.target
ln -fs ../norns.target \
		${TARGET_DIR}/etc/systemd/system/multi-user.target.wants/norns.target
