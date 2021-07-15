# Dockerfile for sunfinity/laravel:5.7 image
# mReschke 2018-08-19

# Inherit from
FROM sunfinity/debian:stretch
LABEL maintainer="mreschke@sunfinity.com"

# Set environment
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# Update apt and install sury.org PHP repositories
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    sh -c 'echo "deb https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list' && \
    apt-get update

# Install NodeJS 8.x LTS (run before apt-get install below)
RUN curl -o install https://deb.nodesource.com/setup_8.x && bash install

# Install PHP 7.1, nodejs and more
RUN apt-get install -y php7.1-cli php7.1-common php7.1-curl php7.1-json php7.1-mbstring php7.1-mcrypt php7.1-mysql php7.1-sybase php7.1-opcache php7.1-readline php7.1-xml php7.1-gd php7.1-zip php7.1-bz2 \
    unzip dos2unix \
    nodejs

# Configure PHP
COPY files/php-cli.ini /etc/php/7.1/cli/php.ini

# Install PHP Composer Package Manager
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Create and set working dir
RUN mkdir -p /root/Code
WORKDIR /root/Code

