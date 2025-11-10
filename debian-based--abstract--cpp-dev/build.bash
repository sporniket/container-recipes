#!/bin/bash

if [$# -ne 1]; then
    echo "Usage: build.bash <base_os_image_name> <version_tag> <release_id>"
    echo
    echo "  * base_os_image_name : name of a container based on a debian-based "
    echo "            distribution ; e.g. 'ubuntu'."
    echo "  * version_tag : tag of said base container to pull, consult the "
    echo "            user manual of your selected container ; e.g. '24.04'."
    echo "  * release_id : suffix that will be added to the container tag ; "
    echo "            e.g. '0.0.1-\$(date -Iminutes)'"
    echo
fi

base_os_image_name="$1"
version_tag="$2"
release_id="$3"
tag_name="abstract--cpp-dev--${base_os_image_name}-${version_tag}--${release_id}"

args="--build-arg BASE_OS_NAME=${base_os_image_name} --build-arg BASE_OS_VERSION=${version_tag} -t ${tag_name}"

set -x
podman build $args .
set +x
