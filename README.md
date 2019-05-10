# htb

docker run -tid --name kali \ 
    -v $(pwd)/htb:/repo \ 
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    kalilinux/kali-linux-docker \ 
    /bin/bash