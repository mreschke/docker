# Dockerfile for mreschke/laravel:5.7 image
# mReschke 2019-04-14

# Laravel is really just the proper version of PHP, NodeJS and a /root/Code working directory

# Inherit from
FROM mreschke/php:7.1
LABEL maintainer="mail@mreschke.com"

# Set environment
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# Install NodeJS 10.x LTS (run before apt-get install below)
RUN curl -o install https://deb.nodesource.com/setup_10.x && bash install

# Install nodejs
RUN apt-get install -y nodejs

# Create and set working dir
RUN mkdir -p /root/Code
WORKDIR /root/Code

