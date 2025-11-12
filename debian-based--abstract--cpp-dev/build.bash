#!/bin/bash
# =========================================
# (c) 2025 David SPORN,
# SPDX-License-Identifier: GPL-3.0-or-later
# -----------------------------------------
#

if [ $# -lt 3 ]; then
    echo "Usage: build.bash <base_os_image_name> <version_tag> <release_id> [args...]"
    echo
    echo
    echo "  * base_os_image_name : "
    echo "      name of a container based on a debian-based distribution ;"
    echo "      e.g. 'ubuntu'."
    echo
    echo "  * version_tag : "
    echo "      tag of said base container to pull, consult the user manual"
    echo "      of your selected container ;"
    echo "      e.g. '24.04'."
    echo
    echo "  * release_id : "
    echo "      suffix that will be added to the container tag ;"
    echo "      e.g. '0.0.1-\$(date -Iminutes)'"
    echo
    echo "  * args... : "
    echo "      optionnal supplemental arguments for podman ;"
    echo "      e.g. '--squash --network=host'"
    echo
    exit 1
fi

base_os_image_name="$1"
version_tag="$2"
release_id="$3"
shift 3
tag_name="abstract--cpp-dev--${base_os_image_name}-${version_tag}:${release_id}"

args="--build-arg BASE_OS_NAME=${base_os_image_name} --build-arg BASE_OS_VERSION=${version_tag} -t ${tag_name}"

set -x
podman build $args "$@" .
set +x
