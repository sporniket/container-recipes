#!/bin/bash
# =========================================
# (c) 2025 David SPORN,
# SPDX-License-Identifier: GPL-3.0-or-later
# -----------------------------------------
#

if [ $# -lt 4 ]; then
    echo "Usage: build.bash <base_image_name> <base_image_version> <release_suffix> <release_id> [args...]"
    echo
    echo
    echo "  * base_image_name : "
    echo "      name of a container containing development tools and required libraries"
    echo "      for compiling hatari ;"
    echo "      e.g. 'localhost/abstract--cpp-dev--ubuntu-24.04'"
    echo "      e.g. 'localhost/abstract--cpp-dev--debian-13.1'"
    echo
    echo "  * base_image_version : "
    echo "      tag of said base container to pull ;"
    echo "      e.g. '0.2.1'"
    echo
    echo "  * release_suffix : "
    echo "      suffix added to 'debian-based--abstract--pulsar-edit' for naming the build ;"
    echo "      e.g. 'ubuntu'"
    echo "      e.g. 'debian'"
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

base_image_name="$1"
base_image_version="$2"
release_suffix="$3"
release_id="$4"
shift 4
tag_name_release="abstract--pulsar-edit--${release_suffix}:${release_id}"
tag_name_latest="abstract--pulsar-edit--${release_suffix}:latest"

args="--build-arg BASE_IMAGE_NAME=${base_image_name} --build-arg BASE_IMAGE_VERSION=${base_image_version} -t ${tag_name_release} -t ${tag_name_latest}"

set -x
podman build $args "$@" .
set +x
