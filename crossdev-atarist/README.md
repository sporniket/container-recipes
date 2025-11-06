# Generate a Docker image with Freemint's cross-tools from tho-otto.de

_See [the m68k-atari-mint cross-tools page from tho-otto.de](https://tho-otto.de/crossmint.php)_

In a nutshell, the dockerfile copies a series of archives (*.tar.xz) from the `repository` folder (host) into `/tmp/archives` on the host, 
as well as an extraction script. The archives are uncompressed into the root of the container. (I trust the archives).

Then, the toolchain is available through the interactive shell of the container.

## How to create and start the container ?

### Linux

```
docker build -t my-freemint-cross-tools .
cd /into/your/project/folder
docker run -it -v "$(pwd):/home/project" my-freemint-cross-tools

## For Windows using gitbash : the windows style path MUST be given
docker run -it -v "C:/Projects/personnal_atari/drv_c/hellowrl.d:/home/project" my-freemint-cross-tools
```

### Windows

_Using gitbash from git install, requires Docker Desktop to be started_

`pwd` will return a linux style path, the Windows style path MUST be given explicitely.

```
docker build -t my-freemint-cross-tools .
cd C:/into/your/project/folder
docker run -it -v "C:/into/your/project/folder:/home/project" my-freemint-cross-tools
```

## Sample code

_Requires Hatari, with a folder configured as GEMDOS emulated hard drive. For instance, I have such a folder located at `C:\Projects\personnal_atari\drv_c\hellowrl.d`, and my dev folder is `C:\Projects\personnal_atari\drv_c\hellowrl.d`._

With your favorite editor on your host OS, create `hello.cpp` : 

```cpp
//hello.cpp
//Just print "hello, TOS !" to std stream

#include <iostream>

int main() {
    std::cout << "Hello, TOS !" << std::endl;
    // loop for some time
    int whatever = 0 ;
    for(int i = 0 ; i < 1000 ; i++) {
        for (int j = 0 ; j < 1000 ; j++) {
            whatever++;
        }
    }
    return 0;
}
```

Then, inside the container shell : 

```
m68k-atari-mintelf-g++ -o hello.prg hello.cpp
```

Now, with Hatari running, navigate into your harddrive, find `hello.prg`, double-click it, and enjoy reading "Hello, TOS !" for some time before it returns to the desktop.


## TODO

* Install build essentials and other tools (e.g. cmake, clang-format, etc...)
