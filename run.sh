#!/bin/bash
image=htb ;
docker stop ${image} || true && docker rm ${image} || true

docker build -t ${image} . ;
docker run -it \
	--cap-add=SYS_ADMIN \
	--cap-add=NET_ADMIN \
	--cpuset-cpus 0 \
	--memory 4GB \
	-e DISPLAY=host.docker.internal:0 \
	--name htb  \
	-v /Users/marco_aurelio_matos/repo/htb:/repo \
	${image} bash;

#docker attach htb
