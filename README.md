# swarm-docker

## Install docker
Install Docker CE from [here](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
>NOTE: Make sure you use ```sudo -E <command>``` wherever necessary for preserving environment variables

Setup HTTP/HTTPS proxy by following instructions given on [this link](https://docs.docker.com/config/daemon/systemd/)

##### Manage Docker as a non-root user
- Create the ```docker``` group.
```sh
sudo groupadd docker
```
- Add your user to the ```docker``` group.
```sh
sudo usermod -aG docker $USER
```
- Log out and log back in so that your group membership is re-evaluated.

- Verify that you can run ```docker``` commands without ```sudo```.
```sh
docker run hello-world
```
Go through [this](https://docs.docker.com/install/linux/linux-postinstall/) page if you face any issues.

## Get started
- Clone this repository and change the working directory to ```swarm-docker```.
- Build docker image using ```Dockerfile```.
```sh
docker build --tag=swarm-docker .
```
- Create container.
```sh
xhost +;
docker run -it --privileged \
    --env=LOCAL_USER_ID="$(id -u)" \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -e DISPLAY=:0 \
    --name=swarm-docker swarm-docker /bin/bash;
```
- Exit the dontainer.
- To use this container.
```sh
xhost +;
sudo docker start swarm-docker;
sudo docker exec -u 0 -it swarm-docker bash
```

> Follow [these instructions](http://gernotklingler.com/blog/howto-get-hardware-accelerated-opengl-support-docker/) in case of any graphics driver issues.
