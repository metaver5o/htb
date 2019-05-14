#!/bin/bash

docker run -it \
	--cap-add=SYS_ADMIN \
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
	m4rc0/private:htb bash;
docker exec -ti htb google-chrome &
docker attach htb
