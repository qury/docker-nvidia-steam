# docker-nvidia-steam
Steam docker with NVIDIA HW acceleration

The main reason for this container is my need to be able to play steam games on my Slackware64-14.2 machine without having to install the 32-bit compatibility layer.

## Pre-requisites
* installed nVidia drivers on your host
* install docker and its dependencies from slackbuilds.org (i use sbopkg and queue files)
* enable both docker and cgroups in /etc/rc.d/ directory
* ensure the nVidia driver is in the same directory as your Dockerfile at build time

Also please make sure that the nvidia driver you use to build your docker container is the same as the one installed on your host.

## Installation

  docker build -t NAMEOFYOURIMAGE .

## Running it
take a look at run.sh and amend the devices and directories as you like

## Todo
* Find out what's the best way to enable pulseaudio (maybe via another container)
