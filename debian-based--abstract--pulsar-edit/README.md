# Make a container with pre-installed Pulsar editor

> (c) 2025 David SPORN,
>
> SPDX-License-Identifier: GPL-3.0-or-later

_This recipe requires a **debian based** image, because I use `apt-*` tools for package management_

_See also [Pulsar, a community-led hackable editor](https://pulsar-edit.dev/)_

This container starts from a debian-based container (use of `apt-*` and `dpkg`) to install one release package of the editor, and then install some plugins.

The package of the version to install is to be downloaded into the `cache-pulsar` beforehand.

## Release notes

### v0.1

Initial "good enough version"

## Which plugins are installed, and why

- `pulsar-ide-clangd atom-ide-definitions atom-ide-hyperclick busy-signal` : A set of plugins to get IDE-like features for C/C++ dev (code navigation) ; see [this article](https://medium.com/@sporniket.studio/taming-pulsar-the-community-led-hyper-hackable-text-editor-part-4-aaf352b4ca09)
- `x-terminal-reloaded` : Allow to have a terminal inside the editor, might become convenient to avoid switching between tasks ?
- `file-icons` : for a nice visual aid to identify file types.

## How to build 

_See [README-build.md](./README-build.md)_

## How to get C/C++ code navigation and hints working in Pulsar

`clangd` should be available in the container.

In order for `clangd` to work, a `compile_commands.json` file MUST be present in the root folder of a C/C++ project. Meaning using `cmake` and `compdb`. See [this article](https://medium.com/@sporniket.studio/taming-pulsar-the-community-led-hyper-hackable-text-editor-part-4-aaf352b4ca09).