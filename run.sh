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
	-v /dev/shm:/dev/shm  \
	--name htb  \
	--device=/dev/net/tun \
	-v /home/marco/repo/htb:/repo \
	--ip6 a:b:c:d::1234 \
	--net=mynetwork \
	${image} bash;

docker attach htb
