# Generate a Docker image to develop applications for the vintage Atari ST

In a nutshell, the container aims to provide : 

* Freemint's cross tools, using premade binaries : _[the m68k-atari-mint cross-tools page from tho-otto.de](https://tho-otto.de/crossmint.php)_
* The [Hatari](https://www.hatari-emu.org/) emulator, to test apps. The provided ROM is [Emutos](https://emutos.sourceforge.io/).
* (TO BE DONE) [Pulsar, a community-led hackable editor](https://pulsar-edit.dev/) with some plugins for source editing with some IDE-ish features.


## TODO

* To have an IDE with navigable source code, I consider including the Pulsar editor
* Some ready to use hatari configuration, with an emulated GEMDOS drive where one can copy the application for actual testing.
