#!/bin/bash
# =========================================
# (c) 2025 David SPORN,
# SPDX-License-Identifier: GPL-3.0-or-later
# -----------------------------------------
#

# usage :
#   run.bash <image_id> <path_to_workspace> [args...]


if [ $# -lt 2 ]; then
    echo "Usage: run.bash <image_id> <path_to_workspace> [args...]"
    echo
    echo
    echo "  * image_id : "
    echo "      fully qualified name of the 'atarist-crossdev' container to start ;" 
    echo "      e.g. 'localhost/atarist-crossdev--ubuntu:0.1.0-SNAPSHOT'"
    echo "      e.g. 'localhost/atarist-crossdev--debian'"
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

image_id="$1"
path_to_workspace="$2"
shift 2

set -x
podman run -it -v "${path_to_workspace}:/home/project" \
    -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
    -v /dev/snd:/dev/snd \
    "${image_id}" "$@"

set +x