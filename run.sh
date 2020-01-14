#!/bin/bash
image=htb ;
docker build -t ${image} . ;
docker run -it \
	--cap-add=SYS_ADMIN \
	--cap-add=NET_ADMIN \
	--cpuset-cpus 0 \
	--memory 4GB \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix:0 \
	--device /dev/snd \
	--device /dev/dri \
	--device=/dev/net/tun \
	-v /dev/shm:/dev/shm  \
	-v /home/marco/repo/htb:/repo \
	--net=mynetwork \
	--name htb  \
	${image} bash;

docker attach htb
