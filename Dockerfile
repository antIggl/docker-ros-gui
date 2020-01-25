FROM ros:melodic

ARG uid

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y ros-melodic-desktop-full
RUN apt-get install -y nano screen bash-completion
RUN apt-get install -y ros-melodic-moveit* ros-melodic-gazebo* ros-melodic-srdf* ros-melodic-urdf*
RUN apt-get install -y ros-melodic-move* ros-melodic-camera* ros-melodic-vision* ros-melodic-viz \
			ros-melodic-video* ros-melodic-nav* ros-melodic-rqt* ros-melodic-rviz* \
			ros-melodic-grasp* ros-melodic-graph* ros-melodic-grpc* ros-melodic-cartes* \
			ros-melodic-gscam* ros-melodic-open-manipulator* ros-melodic-safety* ros-melodic-scheduler* \
			 ros-melodic-shape* ros-melodic-simple* ros-melodic-service-tools ros-melodic-simulators \
			ros-melodic-pcl* ros-melodic-stereo* ros-melodic-photo* ros-melodic-teleop* \
			ros-melodic-pose* ros-melodic-position* ros-melodic-tf* ros-melodic-theora* \
			ros-melodic-joystick* ros-melodic-tracetool* ros-melodic-jpeg* \
			ros-melodic-compress* ros-melodic-controller* ros-melodic-json* ros-melodic-key* \
			ros-melodic-cv* ros-melodic-py* ros-melodic-depth* ros-melodic-qt* ros-melodic-libqt* \
			ros-melodic-distance* ros-melodic-librviz* ros-melodic-libuvc* ros-melodic-usb* \
			ros-melodic-lusb* ros-melodic-realtime* ros-melodic-resized* ros-melodic-robot* \
			ros-melodic-uvc* ros-melodic-visualization* ros-melodic-viz ros-melodic-ros* \
			ros-melodic-mongodb* ros-melodic-warehouse* ros-melodic-web-video* ros-melodic-webrtc* \
			ros-melodic-fetch* ros-melodic-mrpt* ros-melodic-fake-*

COPY ./scripts/init_ros_env.sh /init_ros_env.sh
RUN chmod +x /init_ros_env.sh

RUN useradd  --uid $uid -ms /bin/bash --user-group robot --groups uucp,dialout,plugdev 
#RUN usermod -aG dialout robot

RUN apt-get install -y ipython

USER robot
WORKDIR /home/robot

#ENTRYPOINT /ros_entrypoint.sh
ENTRYPOINT /init_ros_env.sh

