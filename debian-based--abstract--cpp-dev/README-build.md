# The 'build.bash' script, and its wrappers

> (c) 2025 David SPORN,
>
> SPDX-License-Identifier: GPL-3.0-or-later

**Table of content**

* Overview
* Usage
* Wrapper scripts


## Overview

_All the scripts use `podman` as container tool_

A `build.bash` script is provided to create the actual command to build the container image.

## Usage

### Synopsys

```shell
build.bash <base_os_image_name> <version_tag> <release_id> [args...]
```

### Arguments

* `base_os_image_name` : name of a container based on a debian-based distribution ; e.g. `ubuntu`
* `version_tag` : tag of said base container to pull, consult the user manual of your selected container ; e.g. `24.04`
* `release_id` : suffix that will be added to the container tag ; e.g. `0.0.1-$(date -Iminutes)`
* `args...` : optionnal supplemental arguments for podman ; e.g. `--squash --network=host`

### Sample call

```shell
build.bash ubuntu 24.04 0.0.1-SNAPSHOT --network=host
```

## Wrapper scripts

For convenience, some wrapper scripts are also provided for typical use. 

The naming pattern is following : `build-<base_distribution>--<type_of_release>.bash`

* `base_distribution` : either `ubuntu` or `debian`, designate the base distribution to build upon.
* `type_of_release` : either `release` or `snapshot`, the later append a `-SNAPSHOT` suffix to the release id number.

When there are arguments passed to those scripts, they are passed down to the `build.bash` script, where they are passed down to the container tool as additionnal arguments.


* `build-ubuntu--snapshot.bash` and `build-ubuntu--release.bash` rely on a `build-ubuntu.config` and `build.config` files that they source to get some parameters like the release id number, or the base image to use.
* `build-debian--snapshot.bash` and `build-debian--release.bash` rely on a `build-debian.config` and `build.config` files that they source to get some parameters like the release id number, or the base image to use.

