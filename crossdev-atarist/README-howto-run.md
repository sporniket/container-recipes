# How to create and start the container ?

> Instruction are given using `podman`, and it works the same with `docker`.

## Create the container

_It is assumed that the folder `repository` already contains all the required archives_

```
podman build -t my-freemint-cross-tools .
```

## Start the container

> The container is started with the intent to stay in an interactive shell.

## Linux

_Given that the root folder of your project is `/my/computer/my/project`_

```
podman run -it -v "/my/computer/my/project:/home/project" \
    -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
    -v /dev/snd:/dev/snd \
    my-freemint-cross-tools
```

## Windows

> TODO : maybe run using WSL because of /dev/snd and /

_Given that the root folder of your project is `C:/my/computer/my/project`_

```
podman run -it -v "C:/my/computer/my/project:/home/project" my-freemint-cross-tools
```



