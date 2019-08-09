# Dockerfile for mreschke/php:7.1 image
# mReschke 2019-04-14

# Inherit from
FROM nginx:latest
LABEL maintainer="mail@mreschke.com"

# Install some applications
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates inetutils-ping curl nmap

# Customize bash profiles
COPY files/.bashrc /root/.bashrc

# Configure Nginx
COPY files/nginx.conf /etc/nginx/nginx.conf
