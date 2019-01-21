xhost +;

docker run -it --privileged \
    --env=LOCAL_USER_ID="$(id -u)" \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -e DISPLAY=:0 \
    --name=swarm-bionic-melodic swarm-bionic-melodic /bin/bash;
