# From the Kali linux base image
FROM kalilinux/kali-linux-docker

# Update and apt install programs
    RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get install -y \
     exploitdb \
     exploitdb-bin-sploits \
     metasploit-framework \
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
     chromium \
     openssh-server \
     libcanberra-gtk-module \
     curl \ 
     sudo \ 
     vim 


# Install Chrome
RUN apt-get update && apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	hicolor-icon-theme \
	libcanberra-gtk* \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libpango1.0-0 \
	libpulse0 \
	libv4l-0 \
	fonts-symbola \
	--no-install-recommends \
	&& curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
	&& apt-get update && apt-get install -y \
	google-chrome-stable \
	--no-install-recommends \
	# && apt-get purge --auto-remove -y curl \
	&& rm -rf /var/lib/apt/lists/*

# # Add chrome user
# RUN groupadd -r chrome && useradd -r -g chrome -G audio,video chrome \
#     && mkdir -p /home/chrome/Downloads && chown -R chrome:chrome /home/chrome

COPY local.conf /etc/fonts/local.conf

# # Autorun chrome
# ENTRYPOINT [ "google-chrome" ]
# CMD [ "--user-data-dir=/data" ]

# Create known_hosts for git cloning
#     RUN mkdir -p /root/.ssh/
#     RUN touch /root/.ssh/known_hosts

# Add host keys
# RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts
# RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

# Clone git repos
    RUN git clone https://github.com/danielmiessler/SecLists.git /opt/seclists
    RUN git clone https://github.com/PowerShellMafia/PowerSploit.git /opt/powersploit

# Other installs
    RUN pip install pwntools

# Update ENV
    ENV PATH=$PATH:/opt/powersploit
    ENV username marco
    ENV github-username mmatoscom 

# adding user / setting up keys
    RUN useradd -ms /bin/bash  ${username}
    USER ${username}
    RUN mkdir -p /home/${username}/.ssh/
    RUN chmod 700 /home/${username}/.ssh/
    RUN curl https://github.com/${github-username}.keys |head -1 > /home/${username}/.ssh/authorized_keys
    RUN chmod 600 /home/${username}/.ssh/authorized_keys
#   RUN touch /home/${username}/.ssh/known_hosts
    RUN ssh-keyscan github.com >> /home/${username}/.ssh/known_hosts
    RUN chmod go-w /home/${username}
    ENV DISPLAY :0

# Set entrypoint and working directory
#   WORKDIR /root/
    USER root
    RUN usermod -aG sudo ${username}

    USER ${username}
    WORKDIR /home/${username}/

# Indicate we want to expose ports 80 and 443
    EXPOSE 22 80/tcp 443/tcp
    
    