# The 'build.bash' script, and its wrappers

> (c) 2025 David SPORN,
>
> SPDX-License-Identifier: GPL-3.0-or-later

**Table of content**

* Overview
* Required base image
* Usage
* Wrapper scripts


## Overview

_All the scripts use `podman` as container tool_

A `build.bash` script is provided to create the actual command to build the container image.


## Required base image

_It is assumed that the base image `debian-based--abstract--pulsar-edit--xxx` has been created. Check your local cache using `podman image list` to see one of the two lines showed below :

```
$ podman image list
REPOSITORY                                             TAG             IMAGE ID      CREATED      SIZE
...
localhost/debian-based--abstract--pulsar-edit--debian  0.1.0           db49d7b639fd  5 hours ago  3.22 GB
localhost/debian-based--abstract--pulsar-edit--ubuntu  0.1.0           9a511b6994df  7 hours ago  3.21 GB
...

```

## Usage

### Synopsys

```shell
build.bash <base_image_name> <base_image_version> <release_suffix> <release_id> [args...]
```

### Arguments

* `base_image_name` : name of a container containing development tools and required librariesfor compiling hatari ; e.g. `localhost/debian-based--abstract--pulsar-edit--debian'`, `localhost/debian-based--abstract--pulsar-edit--ubuntu`
* `base_image_version` :  tag of said base container to pull ; e.g. `0.1.0`
* `release_suffix` :  suffix added to 'debian-based--abstract--pulsar-edit' for naming the build ; e.g. `ubuntu`, `debian`
* `release_id` : suffix that will be added to the container tag ; e.g. `0.0.1-\$(date -Iminutes)`
* `args...` : optionnal supplemental arguments for podman ; e.g. `--squash --network=host`

## Sample call

```shell
build.bash localhost/abstract--cpp-dev--debian-13.1 0.2.1 debian 0.0.1-SNAPSHOT
```

## Wrapper scripts

For convenience, some wrapper scripts are also provided for typical use. 

The naming pattern is following : `build-<base_distribution>--<type_of_release>.bash`

* `base_distribution` : either `ubuntu` or `debian`, designate the base image to build upon, `localhost/abstract--cpp-dev--ubuntu-24.04'` and `localhost/abstract--cpp-dev--debian-13.1` respectively.
* `type_of_release` : either `release` or `snapshot`, the later append a `-SNAPSHOT` suffix to the release id number.

When there are arguments passed to those scripts, they are passed down to the `build.bash` script, where they are passed down to the container tool as additionnal arguments.


* `build-ubuntu--snapshot.bash` and `build-ubuntu--release.bash` rely on a `build-ubuntu.config` and `build.config` files that they source to get some parameters like the release id number, or the base image to use.
* `build-debian--snapshot.bash` and `build-debian--release.bash` rely on a `build-debian.config` and `build.config` files that they source to get some parameters like the release id number, or the base image to use.

