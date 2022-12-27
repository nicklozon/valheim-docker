FROM ubuntu:kinetic

RUN useradd -m steam

RUN if [[ `uname -m | grep aarch` ]]; then \
      wget https://itai-nelken.github.io/weekly-box86-debs/debian/box86.list -O /etc/apt/sources.list.d/box86.list && \
      wget -qO- https://itai-nelken.github.io/weekly-box86-debs/debian/KEY.gpg | sudo apt-key add - && \
      apt update && \
      apt install box86 -y; \
    fi

RUN dpkg --add-architecture i386 && \
    apt update

RUN echo steam steam/question select "I AGREE" | debconf-set-selections

RUN apt-get install steamcmd -y
RUN apt-get install curl -y


RUN mkdir /valheim
WORKDIR /valheim
RUN /usr/games/steamcmd +login anonymous +force_install_dir /valheim +app_update 896660 +quit

COPY start_server.sh start_server.sh

EXPOSE 2456-2458/udp

CMD [ "./start_server.sh" ]
