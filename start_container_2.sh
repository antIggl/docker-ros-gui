#!/bin/bash

MYWS=$(pwd)/my_catkin_ws
#xhost + local:docker

docker run -it --rm --name myrobot-ros \
		--user robot \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-e DISPLAY=unix$DISPLAY \
		-v $(dirname ${MYWS}):/home/robot --workdir /home/robot/$(basename $MYWS) \
		-e WORKSPACE=/home/robot/$(basename $MYWS) \
		--privileged \
		--device=/dev/ttyUSB0 \
		--device=/dev/ttyUSB1 \
		--device=/dev/ttyUSB2 \
		--device=/dev/ttyACM0 \
		--device=/dev/ttyACM1 \
		--entrypoint /init_ros_env.sh \
		ros-melodic-gui
#		--entrypoint /init_ros_env.sh \
#		--device=/dev/ttyACM0 \




