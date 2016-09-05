# Yocto does not currently work on Ubuntu 15.04, force to 14.04
FROM ubuntu:14.04

# Run update and install in one instruction to force Docker not to use
# its apt-get cache. Otherwise fails to find some packages using Docker's
# 14.04 or trusty tag.
RUN apt-get update && apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat libsdl1.2-dev xterm curl parted

# Clean up
RUN apt-get -y clean

# Cannot run Yocto bitbake as root, create a user "yocto"
RUN useradd -ms /bin/bash yocto
ENV HOME /home/yocto
USER yocto
