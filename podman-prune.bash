#!/bin/bash
# =========================================
# (c) 2025 David SPORN,
# SPDX-License-Identifier: GPL-3.0-or-later
# -----------------------------------------
#

# Remove any untagged image
echo "====[ BEFORE PRUNING ]===="
podman image list --all

echo
echo "====[ PRUNING ]===="
for img in $(podman image list --all | grep "<none>\\s*<none>" | grep -o "[0-9a-f]\{8,\}"); do
    echo "remove image id $img..."
    podman rmi $img
done

echo
echo "====[ AFTER PRUNING ]===="
podman image list --all

echo
echo "----{ DONE }----"
