# How to create and start the container ?

## Create the container

_It is assumed that the base image `debian-based--abstract--cpp-dev--xxx` has been created. Check your local cache using `podman image list` to see one of the two lines showed below :

```
$ podman image list
REPOSITORY                                 TAG             IMAGE ID      CREATED            SIZE
...
localhost/abstract--cpp-dev--debian-13.1   0.2.1           782abd9b5f93  23 hours ago       2.08 GB
localhost/abstract--cpp-dev--ubuntu-24.04  0.2.1           f51fa8074eb6  23 hours ago       2.08 GB
...

```

**Then**, one may build an image using one of the provided convenient `build-xxx.bash` script : 

```
./build-ubuntu--snapshot.bash 
```

## Use the container

> The container is started with the intent to stay in an interactive shell.

There is a `run.bash` script.

### Start the container

_E.g. launching using the provided sample workspace._

```
./run.bash localhost/atarist-crossdev--debian:0.1.0-SNAPSHOT ./sample-workspace
```

The container is run, and then the interactive shell is operationnal.

### Running Hatari

In order to NOT disturb the interactive shell with Hatari logs on console, one will use `podman exec`

First, in another shell, list the running containers to spot your container and its id, e.g : 

```
$ podman ps
CONTAINER ID  IMAGE                                              COMMAND     CREATED        STATUS        PORTS       NAMES
5d9230a3f16e  localhost/atarist-crossdev--debian:0.1.0-SNAPSHOT  /bin/bash   7 seconds ago  Up 7 seconds              naughty_roentgen
```

Here, the container id is `5d9230a3f16e`.

Then, launch hatari with `podman exec` ; you should see Hatari logs, as well as its window : 

```
$ podman exec 69488b028410 hatari
INFO : Hatari v2.6.1, compiled on:  Nov 13 2025, 08:24:12
Loading sym file: /usr/local/share/hatari/tos.sym
Reading 'nm' style ASCII symbols from '/usr/local/share/hatari/tos.sym'...
Removed 176 symbols in same addresses as other symbols.
Skipping detailed duplicate symbols reporting when autoload is enabled.
Loaded 1674 symbols (1225 for code) from '/usr/local/share/hatari/tos.sym'.
Loaded symbols for TOS: /usr/local/share/hatari/tos.img
INFO : NVRAM not found at '/root/.config/hatari/hatari.nvram'
WARN : Bus Error reading at address $ffffa200, PC=$e00d98 addr_e3=e00d98 op_e3=4a10
WARN : Bus Error reading at address $400000, PC=$e00d98 addr_e3=e00d98 op_e3=4a10
WARN : Bus Error reading at address $6c4710, PC=$e00d98 addr_e3=e00d98 op_e3=4a10
...
...etc...
```

Return to your interactive shell session, do your things, then switch to Hatari to do some testing, etc...