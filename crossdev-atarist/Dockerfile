# ======== PREFLIGHT : base system ========
FROM ubuntu:22.04

# Which packages are installed, and why :
# - xz-utils : to unpack the archives
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
            xz-utils \
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
WORKDIR /tmp/from-github
RUN git clone https://github.com/hatari/hatari.git && \
    cd hatari && \
    cmake -Bbuild && \
    cmake --build build && \
    cmake --build build -- help && \
    cmake --build build -- install && \
    cd .. && \
    rm -rf hatari

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
