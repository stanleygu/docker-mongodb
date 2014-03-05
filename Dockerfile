FROM        ubuntu
MAINTAINER  Stanley Gu <stanleygu@gmail.com>
RUN         apt-get update -qq

# Installing base level packages
RUN         apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN         echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

RUN         apt-get update -qq
RUN         apt-get install mongodb-10gen

RUN         mkdir -p /data/db
EXPOSE      27017
ENTRYPOINT  ["usr/bin/mongod"]
