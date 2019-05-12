# From the Kali linux base image
FROM kalilinux/kali-linux-docker

# Update and apt install programs
    RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get install -y \
     exploitdb \
     exploitdb-bin-sploits \
     git \
     gdb \
     gobuster \
     hashcat \
     hydra \
     man-db \
     minicom \
     nasm \
     nmap \
     sqlmap \
     sslscan \
     wordlists \
     python \
     python-pip \
     firefox-esr \
     chromium

# Create known_hosts for git cloning
    RUN mkdir -p /root/.ssh/
    RUN touch /root/.ssh/known_hosts
# Add host keys
# RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts
    RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

# Clone git repos
    RUN git clone https://github.com/danielmiessler/SecLists.git /opt/seclists
    RUN git clone https://github.com/PowerShellMafia/PowerSploit.git /opt/powersploit

# Other installs
    RUN pip install pwntools

# Update ENV
    ENV PATH=$PATH:/opt/powersploit

# adding Marco
    RUN useradd -ms /bin/bash  marco
    RUN mkdir -p /home/marco/.ssh
    RUN curl https://github.com/mmatoscom.keys > /home/marco/.ssh/authorized_keys
    RUN usermod -aG sudo marco

# Set entrypoint and working directory
    WORKDIR /root/

# Indicate we want to expose ports 80 and 443
    EXPOSE 80/tcp 443/tcp