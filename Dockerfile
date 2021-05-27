FROM debian:buster-slim

LABEL author="Retro" maintainer="dankmolot@gmail.com"

# Installing depenches
RUN apt-get update  -y && \
    apt-get upgrade -y && \
    apt-get install -y locales curl ca-certificates openssl && \
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

CMD ["/bin/sh", "/entrypoint.sh"]