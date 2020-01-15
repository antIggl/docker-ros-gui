# docker-ros-gui

Build scripts for a docker container for ROS melodic with GUI tools and devices support.

## Requirements
It works on Linux platform. Docker must be installed in the machine.
It won't work on Windows Platform

## Building the container
```bash
chmod +x ./build_container.sh
./build_container.sh
```
It builds the image "ros-melodic-gui".

## Useful information about the image
* Uses a non-root user named 'robot'
* The default home directory and working directory is the /home/robot/
* ROS workspaces should be initialized in the container not in the host machine, otherwise catkin_make will fail. It is not a priviledges issue.
* Initialization of the ROS melodic is done by the ```/init_ros_env.sh```
* Downloading the prebuilt container, won't work for sure. Building the container in the same machine that is going to run, ensures there won't be any priviledges issues for the host or container users. Alternatively, one can change the uid of the robot user in an existing container to the same as its host machine's user uid.


## Launching the container

```bash
chmod +x ./start_container.sh
./start_container.sh
```

## Mapping a device to the container
Edit ./start_container.sh and add the following argument to the docker run command.
```bash
--device /dev/ttyUSB0
```

## Mapping a workspace in the container
Edit ./start_container.sh and add the following argument
```bash
-v /PATH/TO/MYWS:/home/robot/MYWS
```
The workspace in /PATH/TO/MYWS is going to be mapped in /home/robot/MYWS directory in the container



## Contributors
Antonios Inglezakis (@antiggl)

