FROM debian:latest
MAINTAINER Rik Vermeer "mail@rikvermeer.nl"

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update && apt-get upgrade && apt install -y -q \
	bash bc binutils build-essential bzip2 ca-certificates cpio \
	debianutils g++ gcc gzip libncurses5-dev locales make patch python rsync \
	sed tar unzip wget git fakeroot login pkg-config procps vim

RUN sed -i "s/^# en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen && locale-gen && update-locale LANG=en_US.UTF-8

RUN mkdir -p /src/misc
ADD startup.sh /src/misc/startup.sh
RUN chmod a+x /src/misc/startup.sh

ENTRYPOINT cd /src/misc; ./startup.sh
