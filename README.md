# htb

`docker build -t mykali .` <br> <br>
`docker run -tid --name htb \` <br>
    `-v $(pwd)/htb:/repo \` <br>
    `-e DISPLAY=$DISPLAY` <br>
    `-v /tmp/.X11-unix:/tmp/.X11-unix \` <br>
    `-p 80:80 -p 443:443 \` <br>
    `mykali \` <br>
    `/bin/bash` <br><br>
