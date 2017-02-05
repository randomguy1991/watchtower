FROM centurylink/ca-certs
MAINTAINER Luckych <Luckych@users.noreply.github.com>
LABEL "com.centurylinklabs.watchtower"="true"

COPY watchtower-latest \
ENTRYPOINT ["/watchtower"]
