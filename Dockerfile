FROM centurylink/ca-certs
MAINTAINER Luckych <Luckych@users.noreply.github.com>
LABEL "com.centurylinklabs.watchtower"="true"

WORKDIR /root
CMD ["/bin/s6-svscan", "/etc/s6"]

ENV WATCHTOWER_PATH github.com/randomguy1991/watchtower
ENV WATCHTOWER_REPO https://github.com/randomguy1991/watchtower.git
ENV WATCHTOWER_BRANCH master

ENV GOPATH /usr/local

RUN apk add --no-cache --virtual build-dependencies build-base go git && \
  git clone -b ${WATCHTOWER_BRANCH} ${WATCHTOWER_REPO} /usr/local/src/${WATCHTOWER_PATH} && \
  cd /usr/local/src/${WATCHTOWER_PATH} && \
  go get ./... && \
  go install ${WATCHTOWER_PATH}... && \
  cp /usr/local/bin/watchtower /usr/bin/ && \
  apk del build-dependencies && \
  rm -rf /usr/local/*

ADD rootfs /
