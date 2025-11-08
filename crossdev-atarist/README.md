# Generate a Docker image with Freemint's cross-tools from tho-otto.de

_See [the m68k-atari-mint cross-tools page from tho-otto.de](https://tho-otto.de/crossmint.php)_

In a nutshell, the dockerfile copies a series of archives (*.tar.xz) from the `repository` folder (host) into `/tmp/archives` on the host, 
as well as an extraction script. The archives are uncompressed into the root of the container. (I trust the archives).

Then, the toolchain is available through the interactive shell of the container.


## TODO

* Install build essentials and other tools (e.g. cmake, clang-format, etc...)
* To have an IDE with navigable source code, I consider including the Pulsar editor
* To be complete and propose a runtime environment, I consider including Hatari, with some given configuration files and launcher to start typical configuration (model, RAM, emulated GEMDOS drive,...). Sound capability is a goal, but not at first.
