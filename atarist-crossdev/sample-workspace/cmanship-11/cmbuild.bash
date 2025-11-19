#!/bin/bash
# =========================================
# (c) 2025 David SPORN,
# SPDX-License-Identifier: GPL-3.0-or-later
# -----------------------------------------
#

set -x

cmake --build build --target cmans_11.prg
cp build/cmans_11.prg drive_c

set +x
