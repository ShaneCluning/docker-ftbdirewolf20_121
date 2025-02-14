# syntax=docker/dockerfile:1

FROM openjdk:21-jdk-buster

LABEL version="1.4.1"

RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Presents Direwolf20 1.21 v1.4.1 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx6144m"
ENV VER=100027

CMD ["/launch.sh"]
