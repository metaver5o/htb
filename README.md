# htb

`docker build -t mykali .` <br>
`docker run -tid --name kali \` <br>
    `-v $(pwd)/htb:/repo \` <br>
    `-v /tmp/.X11-unix:/tmp/.X11-unix \` <br>
    `-p 80:80 -p 443:443 \`
    `mykali \` <br>
    `/bin/bash` <br><br>
