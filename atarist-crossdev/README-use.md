# How to use the container

**Table of Content**

* Overview
* the 'run.bash' script, and its wrappers
* Starting apps

## Overview

To be able to use graphical application like the IDE and Hatari, the X11 socket and sound device must be mapped when invoking the container.

_All the scripts use `podman` as container tool_

A `run.bash` script is provided to create the actual command to build the container image.


## the 'run.bash' script, and its wrappers

### Synopsys

```shell
run.bash <image_id> <path_to_workspace> [args...]
```

### Arguments

* `image_id` : fully qualified name of the 'atarist-crossdev' container to start ; e.g. `localhost/atarist-crossdev--ubuntu:0.1.0-SNAPSHOT'`
* `path_to_workspace` : path to the folder containing your projects to work on ; e.g. `./sample-workspace`
* `args...` : optionnal supplemental arguments for podman ; e.g. `--squash --network=host`

### Sample call

```shell
run.bash localhost/atarist-crossdev--ubuntu:0.1.0 ./sample-workspace
```

### Wrapper scripts

For convenience, some wrapper scripts are also provided for typical use. 

The naming pattern is following : `run-<base_distribution>.bash`.

* `base_distribution` : either `ubuntu` or `debian`, designate which image to use for the container, `localhost/atarist-crossdev--ubuntu'` and `localhost/atarist-crossdev--debian` respectively.

The required single argument is the path to workspace as parameter
When there are other arguments passed to those scripts, they are passed down to the `run.bash` script, where they are passed down to the container tool as additionnal arguments.


* `run-ubuntu.bash` and `run-debian.bash` rely on a `run.config` file that they sources to get the image version to use.

## Starting apps

Once a container is started, one can use `podman exec` to start other applications or script in parallel to the interactive shell.

**First** identify the container from which starting the application, using `podman ps` : 

```
$ podman ps
CONTAINER ID  IMAGE                                              COMMAND     CREATED        STATUS        PORTS       NAMES
5d9230a3f16e  localhost/atarist-crossdev--debian:0.1.0-SNAPSHOT  /bin/bash   7 seconds ago  Up 7 seconds              naughty_roentgen
```

Here, the container id is `5d9230a3f16e`.

**Then**, start the application of interest.

|Application|Invokation|Usage|
|---|---|---|
|Hatari|`podman exec <container_id> hatari`|An emulator for the Atari ST, to test your project|
|Pulsar|`podman exec <container_id> pulsar <project_folder>...`|An IDE-ish text editor|

**E.g.**, launching Hatari in the previously identified container : 


```
$ podman exec 5d9230a3f16e hatari
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
