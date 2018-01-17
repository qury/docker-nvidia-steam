#!


docker run -d --security-opt=seccomp:unconfined  --name=steam_mine \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/shadow:/etc/shadow:ro \
-v /etc/sudoers.d:/etc/sudoers.d:ro \
--user=$(id -u) \
--ipc='host' \
--net='host' \
-v /dev/nvidia-modeset:/dev/nvidia-modeset \
-v /dev/nvidia0:/dev/nvidia0 \
-v /dev/nvidiactl:/dev/nvidiactl \
-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
-v /dev/shm:/dev/shm \
-v ${HOME}/Downloads:/tmp/Downloads \
--privileged=true \
-e DISPLAY=${DISPLAY}  tianon/steam