FROM nvidia/cuda:10.0-runtime-ubuntu18.04

LABEL Description="ROS melodic Dockerfile with Python 3 and GUI support in Ubuntu 18.04" Version="1.1"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y curl

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list' \
     && curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -

RUN  apt-get update \
     && apt-get install -y software-properties-common && add-apt-repository ppa:deadsnakes/ppa

RUN  apt-get update \
     && apt-get install -y python3.6 \
     && apt-get install -y python3-pip python3-yaml python3.6-dev python3.6-numpy python3-catkin-tools

RUN apt-get install -y ros-melodic-desktop

# add specific version 3.4.1. 
RUN apt-get install -y ros-melodic-plotjuggler ros-melodic-plotjuggler-ros \
     && apt-get install -y git ros-melodic-image-transport-plugins

# uncomment below and add your apt packages here (if required)
RUN apt-get install -y python3-empy

# uncomment pip upgrade and add your pip packages here (if required)
RUN python3 -m pip install --upgrade pip \
     && python3 -m pip install rospkg opencv-python torchvision

# write source into bashrc
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

# opening directory when starting up a container
WORKDIR /root