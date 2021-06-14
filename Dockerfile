FROM openjdk:15-alpine

LABEL author="Retro" maintainer="dankmolot@gmail.com"

# allow everyone to use /tmp folder
RUN chmod 777 /tmp

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