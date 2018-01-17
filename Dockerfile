FROM tianon/steam
# my system has nvidia, so yours should too!
RUN sudo apt-get update && sudo apt-get install -yq kmod mesa-utils
ADD NVIDIA-Linux-x86_64-387.34.run /tmp/NVIDIA-DRIVER.run
RUN sudo sh /tmp/NVIDIA-DRIVER.run -a -N --ui=none --no-kernel-module
RUN sudo rm /tmp/NVIDIA-DRIVER.run
USER steam
ENV HOME /home/steam
VOLUME /home/steam
CMD ["steam"]
