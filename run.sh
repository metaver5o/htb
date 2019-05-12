docker run -tid --name htb --cap-add=NET_ADMIN --device=/dev/net/tun --memory 6g -e DISPLAY=:0 -v /home/marco/repo/htb:/repo  -v /tmp/.X11-unix:/tmp/.X11-unix m4rc0/private:htb bash ;
docker attach htb

# ports if needed
#  -p 80:80 -p 443:443 
