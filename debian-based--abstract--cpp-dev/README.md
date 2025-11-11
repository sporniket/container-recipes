# Make a base container for general c/c++ development

_This recipe requires a **debian based** image, because I use `apt-*` tools for package management_

## Which packages are installed, and why

- `xz-utils unzip` : to unpack archives
- `git` : to clone project to be installed, and manage local repository from the container
- `curl wget` : usual tools to download things
- `build-essential` : gcc and make
- `clang clang-tidy clang-format` : tools for C/C++
- `clangd` : Language Server Protocol (LSP) implementation for C/C++
- `cmake` : build tool
- `libsdl2-dev zlib1g-dev libpng-dev libreadline-dev libx11-dev libportmidi-dev libudev-dev libcapstone-dev` : dev libraries initially added to compile Hatari
- `pipx` : to install `compdb`
- `vim nano micro` : basic editing in terminal, with the comfort of syntax coloring

## How to build 

_All the scripts use `podman` as container tool_

A `build.bash` script will be provided. For convenience, some convenience scripts will be provided for typical use : 

* `build-ubuntu--snapshot.bash` and `build-ubuntu--release.bash` ; those scripts rely on a `build-ubuntu.config` file that they source to get some parameters like semver version number, base image version tag ; the `--snapshot` variant create a container tagged with semver and timestamp to the second ; the `--release` variant create a container with just the semver.
* `build-debian--snapshot.bash` and `build-debian--release.bash` ; those scripts rely on a `build-debian.config` file that they source to get some parameters like semver version number, base image version tag ; the `--snapshot` variant create a container tagged with semver and timestamp to the second ; the `--release` variant create a container with just the semver.

### Synopsys

```shell
build.bash <base_os_image_name> <version_tag> <release_id>
```

* `base_os_image_name` : name of a container based on a debian-based distribution ; e.g. `ubuntu`
* `version_tag` : tag of said base container to pull, consult the user manual of your selected container ; e.g. `24.04`
* `release_id` : suffix that will be added to the container tag ; e.g. `0.0.1-$(date -Iminutes)`

```shell
# sample call
build.bash ubuntu 24.04 0.0.1-$(date -Iminutes)
```
