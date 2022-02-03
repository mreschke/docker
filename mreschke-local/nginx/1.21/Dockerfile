# Nginx for mReschke Localhost
# mReschke 2022-01-31

FROM nginx:1.21.6-alpine
LABEL maintainer="mail@mreschke.com"

# Install additional packages
#RUN apk update && apk add \
#    nginx-mod-http-brotli \
#    nginx-mod-http-fancyindex

# Copy over basic .ashrc
ENV ENV="/root/.ashrc"
COPY files/.ashrc /root/.ashrc

# Copy over custom nginx.conf
COPY files/nginx /etc/nginx
#COPY files/nginx.conf /etc/nginx/nginx.conf

# Copy over custom conf.d
#COPY files/conf.d /etc/nginx/conf.d

# Copy over custom index.html for default site
COPY files/index.html /usr/share/nginx/html/index.html

# Copy over SSL certs
#COPY files/certs /etc/nginx/certs

# Bind mounts
#VOLUME /etc/nginx/nginx.conf /etc/nginx/nginx.conf

# Export Ports
EXPOSE 80
EXPOSE 443
