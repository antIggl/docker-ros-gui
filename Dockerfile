FROM ros:melodic

ARG uid

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y ros-melodic-desktop-full
RUN apt-get install -y nano screen bash-completion
RUN apt-get install -y ros-melodic-moveit* ros-melodic-gazebo* ros-melodic-srdf* ros-melodic-urdf*

COPY ./scripts/init_ros_env.sh /init_ros_env.sh
RUN chmod +x /init_ros_env.sh

RUN useradd  --uid $uid -ms /bin/bash --user-group robot --groups uucp,dialout,plugdev 
#RUN usermod -aG dialout robot

RUN apt-get install -y ipython

USER robot
WORKDIR /home/robot

#ENTRYPOINT /ros_entrypoint.sh
ENTRYPOINT /init_ros_env.sh

