# Dockerfile
#
# docker run -i --tty --rm helje5/swift-pgdev:latest
#
# This is an x86_64 image for Swift w/ Emacs and such installed.
#
# To build:
#
#   docker build -t helje5/swift-pgdev:latest -t helje5/swift-pgdev:4.0.3 \
#  	         -f swift-pgdev.dockerfile .
#   docker push helje5/swift-pgdev:4.0.3
#   docker push helje5/swift-pgdev:latest
#
FROM helje5/swift-dev:4.0.3

LABEL maintainer "Helge Heß <me@helgehess.eu>"

USER root

RUN apt-get update && apt-get install -y \
	postgresql libpq-dev postgresql-server-dev-all

USER postgres

RUN bash -c "/etc/init.d/postgresql start && createuser --superuser swift; /etc/init.d/postgresql stop"
RUN bash -c "/etc/init.d/postgresql start && createdb swift; /etc/init.d/postgresql stop"

USER root
WORKDIR /tmp

RUN curl -L -o plswift.tgz https://github.com/PL-Swift/plswift/archive/0.0.5.tar.gz

RUN bash -c "\
  tar zxf plswift.tgz; cd PLSwift*; \
  make; \
  make install; \
  cd ..; \
  rm -rf plswift* PLSw*; \
  swift pl validate\
"

USER swift
WORKDIR /home/swift
