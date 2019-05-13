# Dockerfile for mreschke/debian:stretch image
# mReschke 2019-04-14

# Inherit from
FROM debian:stretch

# Set environment
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# Update apt and install the basics
RUN apt-get update && \
    apt-get install -y curl wget nano apt-transport-https ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Customize bash profiles
COPY files/.bashrc /root/.bashrc
