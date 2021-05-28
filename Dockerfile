FROM openjdk:17-alpine

LABEL author="Retro" maintainer="dankmolot@gmail.com"

# setting up enviroment
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/home/container" \
    "container"

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/sh", "/entrypoint.sh"]