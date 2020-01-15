#!/bin/bash

xhost + local:docker

docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY ros-melodic-gui /bin/bash



