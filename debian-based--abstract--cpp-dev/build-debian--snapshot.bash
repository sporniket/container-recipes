#!/bin/bash
# =========================================
# (c) 2025 David SPORN,
# SPDX-License-Identifier: GPL-3.0-or-later
# -----------------------------------------
#

source ./build.config
source ./build-debian.config

./build.bash debian "${CONFIG_BASE_VERSION_TAG}" "${RELEASE_ID}-SNAPSHOT" "$@"
