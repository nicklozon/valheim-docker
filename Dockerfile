FROM ubuntu:groovy

RUN useradd -m steam

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