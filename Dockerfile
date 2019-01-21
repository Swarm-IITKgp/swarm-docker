# This is an auto generated Dockerfile for ros:desktop-full
# generated from docker_images/create_ros_image.Dockerfile.em
FROM osrf/ros:melodic-desktop-bionic

#setup proxy
ENV http_proxy 'http://172.16.2.30:8080/'
ENV https_proxy 'http://172.16.2.30:8080/'

#RUN echo "Acquire::http::proxy \"http://172.16.2.30:8080/\";" >> /etc/apt/apt.conf
#RUN echo "Acquire::https::proxy \"http://172.16.2.30:8080/\";" >> /etc/apt/apt.conf

# install ros packages
RUN apt-get update && apt-get install -y \
    ros-melodic-desktop-full \
&& rm -rf /var/lib/apt/lists/*

RUN apt-get install git

RUN echo "/opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc

CMD ["bash"]
