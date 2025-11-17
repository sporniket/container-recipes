#!/bin/bash
# =========================================
# (c) 2025 David SPORN,
# SPDX-License-Identifier: GPL-3.0-or-later
# -----------------------------------------
#

START_DIR="$(pwd)"
ACTUAL_SCRIPT="$(realpath $0)"
ROOT_DIR="$(dirname $ACTUAL_SCRIPT)"

set -x

cd $ROOT_DIR/debian-based--abstract--cpp-dev
./build-ubuntu--release.bash
./build-debian--release.bash

cd $ROOT_DIR/debian-based--abstract--pulsar-edit
./build-ubuntu--release.bash
./build-debian--release.bash

cd $ROOT_DIR/atarist-crossdev
./build-ubuntu--release.bash
./build-debian--release.bash

set +x

echo
echo "ALL DONE SUCCESSFULLY !"
echo 

podman image list

