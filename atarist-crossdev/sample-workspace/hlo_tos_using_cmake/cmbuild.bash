#!/bin/bash
# =========================================
# (c) 2025 David SPORN,
# SPDX-License-Identifier: GPL-3.0-or-later
# -----------------------------------------
#

set -x

cmake --build build --target hlo_tos.prg
cp build/hlo_tos.prg drive_c

set +x
