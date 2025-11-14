# Make a base container for general c/c++ development

> (c) 2025 David SPORN,
>
> SPDX-License-Identifier: GPL-3.0-or-later

_This recipe requires a **debian based** image, because I use `apt-*` tools for package management_

## Release notes

### v0.2

Added libcriterion to write test suites.

* Patch 1 : fixed semver number

### v0.1

Initial "good enough version"

* Patch 1 : fixed tagging, provided build scripts passes supplemental args to podman.

## Which packages are installed, and why

- `xz-utils unzip` : to unpack archives
- `git` : to clone project to be installed, and manage local repository from the container
- `curl wget` : usual tools to download things
- `build-essential` : gcc and make
- `clang clang-tidy clang-format` : tools for C/C++
- `clangd` : Language Server Protocol (LSP) implementation for C/C++
- `cmake` : build tool
- `libsdl2-dev zlib1g-dev libpng-dev libreadline-dev libx11-dev libportmidi-dev libudev-dev libcapstone-dev` : dev libraries initially added to compile Hatari
- `libcriterion-dev` : a library to write test suites
- `pipx` : to install `compdb`
- `vim nano micro` : basic editing in terminal, with the comfort of syntax coloring

## How to build 

_See [README-build.md](./README-build.md)_