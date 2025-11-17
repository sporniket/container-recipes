# Generate a Docker image to develop applications for the vintage Atari ST

In a nutshell, the container aims to provide : 

* Freemint's cross tools, using premade binaries : _[the m68k-atari-mint cross-tools page from tho-otto.de](https://tho-otto.de/crossmint.php)_
* The [Hatari](https://www.hatari-emu.org/) emulator, to test apps. The provided ROM is [Emutos](https://emutos.sourceforge.io/).


**Some files MUST be downloaded beforehand**, according to what you want

* The archives from https://tho-otto.de/crossmint.php must be put in the `cache-crossmint` folder.
* The 1024k Emutos ROM archive (`emutos-1024k-<version>.zip`) [from the release files](https://sourceforge.net/projects/emutos/files/emutos/) must be put in the `cache-emutos` folder.

## Release notes

### v0.1

Initial "good enough version"

* Patch 1 : upgrade to base image _abstract--pulsar-edit--*:0.1.1_

## Which archive are installed, and why

_See [cache-crossmint/README.md](.cache-crossmint/README.md) for the details of my own selection_.

In a nutshell, for now I selected the `*-mintelf-*` binaries because I find it nice to have that hybrid support.

## How to build 

_See [README-build.md](./README-build.md)_

## How to use the container

_See [README-use.md](./README-use.md)_
