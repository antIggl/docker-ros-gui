#!/bin/bash

docker build -t ros-melodic-gui --build-arg uid=$(id -u) .


