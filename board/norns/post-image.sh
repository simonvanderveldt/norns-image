#!/bin/bash

set -e

BOARD_DIR="$(dirname $0)"
BOARD_NAME="$(basename ${BOARD_DIR})"
GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

# Rename dt-blob.dtb to dt-blob.bin
if [ -f ${BINARIES_DIR}/dt-blob.dtb ]; then
  mv "${BINARIES_DIR}/dt-blob.dtb" "${BINARIES_DIR}/dt-blob.bin"
fi

# Replace the default rpi cmdline.txt
cp -f ${BOARD_DIR}/cmdline.txt $BINARIES_DIR/rpi-firmware/

rm -rf "${GENIMAGE_TMP}"

genimage                           \
	--rootpath "${TARGET_DIR}"     \
	--tmppath "${GENIMAGE_TMP}"    \
	--inputpath "${BINARIES_DIR}"  \
	--outputpath "${BINARIES_DIR}" \
	--config "${GENIMAGE_CFG}"

exit $?
