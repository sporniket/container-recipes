# ======== PREFLIGHT : base system ========
FROM ubuntu:22.04

# beyond update all the packages, install
# - xz-utils to unpack the archives
# - build-essential gcc and make
# - clang* c/cpp tools, Language Server Implementation
#
# TODO
# - python 3 ? to install compdb later with pipx install compdb
# - required dependencies to build and install Hatari with emutos
# - required dependencies to build/install pulsar (or just get the deb package)

RUN apt-get update && \
    apt-get install -y xz-utils build-essential clang clangd clang-tidy clang-format && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# ======== STEP : prepare and extract Freemint crosstools archives ========
WORKDIR /tmp/archives

# TODO : explicit list of archives, not needed now because curated by myself.
# TODO : this may require a generator of Dockerfile to get a taylored content.
COPY repository/*.tar.xz ./

# -- extraction
COPY extract-archives.bash /tmp/

RUN chmod +x /tmp/extract-archives.bash && \
    /tmp/extract-archives.bash

# -- cleanstep
RUN rm -rf /tmp/archives /tmp/extract-archives.bash

# ======== STEP : prepare working directory ========
# (to be mounted from the host's current working directory)
RUN mkdir -p /home/project
WORKDIR /home/project

# ======== POSTFLIGHT : get the user into a shell ========
CMD ["/bin/bash"]
