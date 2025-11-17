#!/bin/bash
# =========================================
# (c) 2025 David SPORN,
# SPDX-License-Identifier: GPL-3.0-or-later
# -----------------------------------------
#

set -x

cmake -Bbuild . --fresh
compdb -p build/ list > compile_commands.json

set +x
