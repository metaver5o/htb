 docker run -it --net host  --cap-add=SYS_ADMIN --cpuset-cpus 0 --memory 4GB -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix:0 --device /dev/snd --device /dev/dri -v /dev/shm:/dev/shm --name chrome chrome 
