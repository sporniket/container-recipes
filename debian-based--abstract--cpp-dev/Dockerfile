# =========================================
# (c) 2025 David SPORN,
# SPDX-License-Identifier: GPL-3.0-or-later
# -----------------------------------------
#
# ======== Build parameterization ========

# Base OS, select a debian-based distribution
# This is because I use *.deb packages
# Also note, I primarily work on ubuntu, some package MAY be specific ? TO BE CHECKED.
ARG BASE_OS_NAME=ubuntu
ARG BASE_OS_VERSION=24.04

# ======== Recipe ========
FROM ${BASE_OS_NAME}:${BASE_OS_VERSION}

RUN apt-get update && \
    apt-get install -y \
            xz-utils unzip \
            git \
            build-essential \
            clang clang-tidy clang-format \
            clangd \
            cmake \
            libsdl2-dev zlib1g-dev libpng-dev libreadline-dev libx11-dev libportmidi-dev \
            pipx \
            vim nano micro \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pipx ensurepath && \
    pipx install compdb

