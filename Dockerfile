FROM debian:buster-slim

LABEL author="Retro" maintainer="dankmolot@gmail.com"

# Installing core
RUN dpkg --add-architecture i386 && \
    apt-get update  -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends locales curl ca-certificates openssl && \
    
# installing mysql lib
    curl -o mysql-apt.deb https://dev.mysql.com/get/mysql-apt-config_0.8.17-1_all.deb && \
    DEBIAN_FRONTEND=noninteractive dpkg -i mysql-apt.deb && \
    rm mysql-apt.deb && \

# installing other libraries
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends lib32gcc1 lib32stdc++6 libtinfo5:i386 libmysqlclient-dev:i386 && \

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