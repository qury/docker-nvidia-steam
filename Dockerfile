FROM tianon/steam as intermediate
ARG NVIDIA_VERSION=387.34

RUN test -n "$NVIDIA_VERSION" || ( echo "Please provide nvidia driver version" && exit 1)
#ADD NVIDIA-Linux-x86_64-387.34.run /tmp/NVIDIA-DRIVER.run
RUN curl http://uk.download.nvidia.com/XFree86/Linux-x86_64/${NVIDIA_VERSION}/NVIDIA-Linux-x86_64-${NVIDIA_VERSION}.run -o /tmp/NVIDIA-DRIVER.run 
# finally, /result ends up with the final data

FROM tianon/steam

# my system has nvidia, so yours should too!
RUN sudo apt-get update && sudo apt-get install -yq kmod mesa-utils

# The installing the below might or might not work, i've not tested it yet 
# RUN sudo add-apt-repository ppa:graphics-drivers/ppa
# RUN sudo apt-get install -y-q nvidia-driver-396

# Check if nvidia version is defined
COPY --from=intermediate /tmp/NVIDIA-DRIVER.run /tmp/NVIDIA-DRIVER.run

RUN sudo sh /tmp/NVIDIA-DRIVER.run -a -N --install-libglvnd --ui=none --no-kernel-module && \
    sudo rm /tmp/NVIDIA-DRIVER.run

# Not sure if usefull with PULSE_SERVER
COPY pulse-client.conf /etc/pulse/client.conf

# good fonts
COPY local.conf /etc/fonts/local.conf

USER steam
ENV HOME /home/steam
VOLUME /home/steam
CMD ["steam"]
