FROM debian:buster-slim

LABEL author="Retro" maintainer="dankmolot@gmail.com"

# Installing core and required libraries
RUN dpkg --add-architecture i386 && \
    apt-get update  -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends locales curl ca-certificates openssl gdb && \
    apt-get install -y --no-install-recommends lib32gcc1 lib32stdc++6 libtinfo5:i386 libsdl2-2.0-0:i386 libsdl2-2.0-0 libicu63 && \

# Cleanup apt
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

# set locale to utf8
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# allow everyone to use /tmp folder
RUN chmod 777 /tmp

# setting up enviroment
RUN useradd -d /home/container -m container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]