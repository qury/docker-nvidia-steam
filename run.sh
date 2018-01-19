#!/bin/sh
# The below directory is where id create a new SteamLibrary, 
# so i do not have to download games every time.
# -v ${HOME}/Downloads:/home/Downloads \  

# Also please note that the below example uses my nvidia card
# your systems might have different device id's.

NAMEOFYOURIMAGE="image/to:use"

xhost +
set -e

USER_UID=$(id -u)
USER_GID=$(id -g)

docker run  -ti \
--name=steam_mine \
-e "USER_UID=${USER_UID}" \
-e "USER_GID=${USER_GID}" \
--ipc='host' \
--device  /dev/nvidia-modeset:/dev/nvidia-modeset  \
--device /dev/nvidia-uvm:/dev/nvidia-uvm  \
--device /dev/nvidia0:/dev/nvidia0  \
--device /dev/nvidiactl:/dev/nvidiactl \
--device /dev/dri/card0:/dev/dri/card0 \
--device /dev/dri/renderD128:/dev/dri/renderD128 \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /dev/shm:/dev/shm \
-v ${HOME}/Downloads:/home/Downloads \  
--privileged=true \
-v /run/user/${USER}/pulse:/run/user/1000/pulse \
-e PULSE_SERVER=unix:/run/user/1000/pulse/native \
-e DISPLAY=${DISPLAY} ${NAMEOFYOURIMAGE}
