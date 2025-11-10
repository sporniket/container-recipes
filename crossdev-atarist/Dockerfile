# ======== Build parameterization ========

# Base OS, select a debian-based distribution
# This is because I use *.deb packages
# Also note, I primarily work on ubuntu, some package MAY be specific ? TO BE CHECKED.
ARG BASE_OS_NAME=ubuntu
ARG BASE_OS_VERSION=24.04

# Emutos paramterization
ARG ETOS_SIZE=1024k
ARG ETOS_VERSION=1.4

# ======== PREFLIGHT : base system ========
FROM ${BASE_OS_NAME}:${BASE_OS_VERSION}

# Which packages are installed, and why :
# - xz-utils unzip : to unpack archives
# - git : to clone hatari
# - build-essential : gcc and make
# - clang clang-tidy clang-format : tools for C/C++
# - clangd : Language Server Protocol (LSP) implementation for C/C++
# - cmake : build tool for hatari
# - libsdl2-dev zlib1g-dev libpng-dev
#       libreadline-dev libx11-dev libportmidi-dev 
#       libreadline-dev libx11-dev libportmidi-dev  : dev libraries to compile Hatari
#
# TODO
# - python 3 ? to install compdb later with pipx install compdb
# - required dependencies to build and install Hatari with emutos
# - required dependencies to build/install pulsar (or just get the deb package)
#
# NOTES
# Hatari compiling : 
#     IPF support libraries not installed. Seems to be a hassle to get (the version to use is there https://www.kryoflux.com/?page=download)
#     Not my priority since I am not the target audience of IPF disk images.

RUN apt-get update && \
    apt-get install -y \
            xz-utils unzip \
            git \
            build-essential \
            clang clang-tidy clang-format \
            clangd \
            cmake \
            libsdl2-dev zlib1g-dev libpng-dev libreadline-dev libx11-dev libportmidi-dev libreadline-dev libx11-dev libportmidi-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# ======== STEP : clone, compile and install Hatari ========
WORKDIR /tmp/build-hatari

# Emutos paramterization
# Duplicated here because initial statement seems "forgotten"
ARG ETOS_SIZE=1024k
ARG ETOS_VERSION=1.4

COPY extract-emutos.bash cache-emutos/emutos-${ETOS_SIZE}-${ETOS_VERSION}.zip ./

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

COPY cache-crossmint/*.tar.xz ./

# -- extraction
COPY extract-crossmint.bash /tmp/

RUN chmod +x /tmp/extract-crossmint.bash && \
    /tmp/extract-crossmint.bash && \
    rm -rf /tmp/crossmint /tmp/extract-crossmint.bash

# ======== STEP : prepare working directory ========
# (to be mounted from the host's current working directory)
RUN mkdir -p /home/project
WORKDIR /home/project

# ======== POSTFLIGHT : get the user into a shell ========
CMD ["/bin/bash"]
