#!/bin/sh
docker run  -ti \
--name=steam_mine \
--device  /dev/nvidia-modeset:/dev/nvidia-modeset  \
--device /dev/nvidia-uvm:/dev/nvidia-uvm  \
--device /dev/nvidia0:/dev/nvidia0  \
--device /dev/nvidiactl:/dev/nvidiactl \
--device /dev/dri/card0:/dev/dri/card0 \
--device /dev/dri/renderD128:/dev/dri/renderD128 \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /dev/shm:/dev/shm \
-v ${HOME}/Downloads:/tmp/Downloads \
--privileged=true \
-e DISPLAY=${DISPLAY} NAMEOFYOURIMAGE
