# Dockerfile for mreschke/apt-cacher image
# mReschke 2019-04-14

# Inherit from
FROM debian:stretch
LABEL maintainer="mail@mreschke.com"

VOLUME ["/var/cache/apt-cacher-ng"]
RUN apt-get update && apt-get install -y apt-cacher-ng

EXPOSE 3142
CMD chmod 777 /var/cache/apt-cacher-ng && \
    /etc/init.d/apt-cacher-ng start && \
    tail -f /var/log/apt-cacher-ng/*
