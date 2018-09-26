# docker-nvidia-steam
Steam docker with NVIDIA HW acceleration

The main reason for this container is my need to be able to play steam games on my Slackware64-14.2 machine without having to install the 32-bit compatibility layer.

## Pre-requisites
* installed nVidia drivers on your host
* install docker and its dependencies from slackbuilds.org (i use sbopkg and queue files)
* enable both docker and cgroups in /etc/rc.d/ directory
* ensure the nVidia driver is in the same directory as your Dockerfile at build time

Also please make sure that the nvidia driver you use to build your docker container is the same as the one installed on your host.

### Pulseaudio - Slackware64
Your distribution might have everything configured for you, but Slackware does not use the variables XDG_RUNTIME_DIR and it also does not have the /run/user/ directories set up. So i created a file in /etc/profile.d to do it.(/etc/profile.d/docker.sh)

```
#!/bin/sh

if [ "$XDG_RUNTIME_DIR" = "" ]; then
 XDG_RUNTIME_DIR=/run/user/$USER
 mkdir -p /run/user/$USER
 chown -R $USER /run/user/$USER
fi


if [ "$PULSE_FOLDER" = "" ]; then
 PULSE_FOLDER=$XDG_RUNTIME_DIR/pulse
 mkdir -p $XDG_RUNTIME_DIR/pulse
 chown -R $USER $XDG_RUNTIME_DIR/pulse
fi

export XDG_RUNTIME_DIR
export PULSE_FOLDER


```


## Installation

```
 docker build -t NAMEOFYOURIMAGE .
```
## Running it
take a look at run.sh and amend the devices and directories as you like

## Todo
* figure out how to make the steam install directory permanent

### Issues
* When i want to start up a stopped container, steam refuses to run. When i start up a new instance steam installs again, and i have to start from scratch (hence having a steam library mapped outside of the container so i do not have to install games inside again and again).
