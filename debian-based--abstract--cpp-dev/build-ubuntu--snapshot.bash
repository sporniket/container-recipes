#!/bin/bash
# =========================================
# (c) 2025 David SPORN,
# SPDX-License-Identifier: GPL-3.0-or-later
# -----------------------------------------
#

source ./build.config
source ./build-ubuntu.config

./build.bash ubuntu "${CONFIG_BASE_VERSION_TAG}" "${CONFIG_SEMVER_NUMBER}-$(date +%Y-%m-%d--%H-%M-%S)"
