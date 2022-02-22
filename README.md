# ros-docker

## Prerequisites
Install [nvidia-container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html).

## Building
Name the image after the `-t` tag however you would like, then run the command in the repository root (leave the dot after the name tag).

    docker build -t norbertmarko/melodic:1.0 .

## Usage
Open two terminal windows, in the first one run the following command (replace the name at the end if you renamed the image during build):
    
    docker run -it --rm --privileged=true --network=host norbertmarko/melodic:1.0

In the second window, run the command below:

    docker run -it --rm --privileged=true --network=host -v ~/catkin_ws:/root/catkin_ws --shm-size '4gb' --gpus all -e NVIDIA_DRIVER_CAPABILITIES=all -e ROS_MASTER_URI=http://work-pc:11311/ -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix test:1.1

**Command explanations**:
- `-v`: Mounts local volume from your filesystem, set the left side of the colon to your catkin workspace path.