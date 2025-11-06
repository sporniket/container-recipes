# ======== PREFLIGHT : base system ========
FROM ubuntu:22.04

# TODO : add build essentials, cmake ?
RUN apt-get update && \
    apt-get install -y xz-utils && \
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