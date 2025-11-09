# How to create and start the container ?

> Instruction are given using `docker`, and it works the same with `podman`.

## Create the container

_It is assumed that the folder `repository` already contains all the required archives_

```
docker build -t my-freemint-cross-tools .
```

## Start the container

> The container is started with the intent to stay in an interactive shell.

## Linux

_Given that the root folder of your project is `/my/computer/my/project`_

```
docker run -it -v "/my/computer/my/project:/home/project" my-freemint-cross-tools
```

## Windows

_Given that the root folder of your project is `C:/my/computer/my/project`_

```
docker run -it -v "C:/my/computer/my/project:/home/project" my-freemint-cross-tools
```



