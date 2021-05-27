FROM openjdk:8-alpine

LABEL author="Retro" maintainer="dankmolot@gmail.com"

# setting up enviroment
RUN useradd -d /home/container -m container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/sh", "/entrypoint.sh"]