#!/bin/bash
# =========================================
# (c) 2025 David SPORN,
# SPDX-License-Identifier: GPL-3.0-or-later
# -----------------------------------------
#

if [ $# -lt 1 ]; then
    echo "Usage: run-debian.bash <path_to_workspace> [args...]"
    echo
    echo "  * path_to_workspace : "
    echo "      path to the folder containing your projects to work on ;"
    echo "      e.g. './sample-workspace'"
    echo
    echo "  * args... : "
    echo "      optionnal supplemental arguments for podman ;"
    echo "      e.g. '--squash --network=host'"
    echo
    exit 1
fi

source ./run.config

path_to_workspace="$1"
shift 1

./run.bash "localhost/atarist-crossdev--debian:${RELEASE_ID}" "${path_to_workspace}" "$@"
