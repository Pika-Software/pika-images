FROM debian:buster-slim

LABEL author="Retro" maintainer="dankmolot@gmail.com"

# Installing core and required libraries
RUN dpkg --add-architecture i386 && \
    apt-get update  -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends locales curl ca-certificates openssl && \
    apt-get install -y --no-install-recommends lib32gcc1 lib32stdc++6 libtinfo5:i386 libsdl2-2.0-0:i386 && \

# Cleanup apt
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

# set locale to utf8
RUN sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen && \
    locale-gen

# setting up enviroment
RUN useradd -d /home/container -m container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]