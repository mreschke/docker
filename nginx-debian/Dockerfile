# Dockerfile for mreschke/nginx image
# mReschke 2019-06-28

# Inherit from
FROM mreschke/debian:stretch
LABEL maintainer="mail@mreschke.com"

# Set environment
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx-light

# Configure Nginx
#COPY files/nginx.conf /etc/nginx/nginx.conf
