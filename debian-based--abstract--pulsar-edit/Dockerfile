# =========================================
# (c) 2025 David SPORN,
# SPDX-License-Identifier: GPL-3.0-or-later
# -----------------------------------------
#
# ======== Build parameterization ========

# Base image : name and version (tag)
# Debian based image, because I use apt tools
ARG BASE_IMAGE_NAME=abstract--cpp-dev--ubuntu-24.04
ARG BASE_IMAGE_VERSION=0.2.1

# ======== PREFLIGHT : base system ========
FROM ${BASE_IMAGE_NAME}:${BASE_IMAGE_VERSION}

# ======== STEP : install Pulsar-edit *.deb and some packages ========
WORKDIR /tmp/install-pulsar

COPY cache-pulsar/*.deb ./

RUN apt-get update && \
    echo "installing dependencies for pulsar-edit..." && \
    apt-get install -y libnotify4 libnss3 xdg-utils libsecret-1-0 && \
    echo "installing pulsar..." && \
    dpkg -i /tmp/install-pulsar/*.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo "installing pulsar plugins..." && \
    ppm install --verbose pulsar-ide-clangd atom-ide-definitions atom-ide-hyperclick x-terminal-reloaded busy-signal file-icons 

