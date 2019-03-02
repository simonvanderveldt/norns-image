#!/bin/bash
set -e

BOARD_DIR="$(dirname $0)"

# Replace the rpi config.txt file
cp -f ${BOARD_DIR}/config.txt $BINARIES_DIR/

# Enable norns.target
ln -fs ../norns.target \
		${TARGET_DIR}/etc/systemd/system/multi-user.target.wants/norns.target
