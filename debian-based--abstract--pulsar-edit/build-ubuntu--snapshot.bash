#!/bin/bash
# =========================================
# (c) 2025 David SPORN,
# SPDX-License-Identifier: GPL-3.0-or-later
# -----------------------------------------
#

source ./build.config
source ./build-ubuntu.config

./build.bash "${BASE_IMAGE_NAME}" "${BASE_IMAGE_VERSION}" "${RELEASE_SUFFIX}" "${RELEASE_ID}-SNAPSHOT" "$@"
