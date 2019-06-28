# Dockerfile for mreschke/php:7.1 image
# mReschke 2019-04-14

# Inherit from
FROM nginx:latest
LABEL maintainer="mail@mreschke.com"

# Customize bash profiles
COPY files/.bashrc /root/.bashrc

# Configure Nginx
COPY files/nginx.conf /etc/nginx/nginx.conf
