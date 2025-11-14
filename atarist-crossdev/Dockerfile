# =========================================
# (c) 2025 David SPORN,
# SPDX-License-Identifier: GPL-3.0-or-later
# -----------------------------------------
#
# ======== Build parameterization ========

# Base image : name and version (tag)
ARG BASE_IMAGE_NAME=abstract--cpp-dev--ubuntu-24.04
ARG BASE_IMAGE_VERSION=0.2.1

# Emutos paramterization
ARG ETOS_SIZE=1024k
ARG ETOS_VERSION=1.4

# ======== PREFLIGHT : base system ========
FROM ${BASE_IMAGE_NAME}:${BASE_IMAGE_VERSION}

# ======== STEP : clone, compile and install Hatari ========
WORKDIR /tmp/build-hatari

# Emutos paramterization
# See https://github.com/moby/moby/issues/37345#issuecomment-400245466
# Will use global parameters from the beginning
ARG ETOS_SIZE
ARG ETOS_VERSION

COPY cache-scripts/extract-emutos.bash cache-emutos/emutos-${ETOS_SIZE}-${ETOS_VERSION}.zip ./

RUN git clone https://github.com/hatari/hatari.git && \
    cd hatari && \
    cmake -Bbuild && \
    cmake --build build && \
    cmake --build build -- help && \
    cmake --build build -- install && \
    cd /tmp/build-hatari && \
    chmod +x extract-emutos.bash && \
    /tmp/build-hatari/extract-emutos.bash "${ETOS_SIZE}" "${ETOS_VERSION}" && \
    cd /tmp && \
    rm -rf /tmp/build-hatari


# ======== STEP : prepare and extract Freemint crosstools archives ========
WORKDIR /tmp/crossmint

COPY cache-scripts/extract-crossmint.bash cache-crossmint/*.tar.xz ./

RUN chmod +x /tmp/crossmint/extract-crossmint.bash && \
    /tmp/crossmint/extract-crossmint.bash && \
    cd /tmp && \
    rm -rf /tmp/crossmint /tmp/extract-crossmint.bash

# ======== STEP : prepare working directory ========
# (to be mounted from the host's current working directory)
RUN mkdir -p /home/project
WORKDIR /home/project

# ======== POSTFLIGHT : get the user into a shell ========
CMD ["/bin/bash"]
