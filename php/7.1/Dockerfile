# Dockerfile for mreschke/php:7.1 image
# mReschke 2019-04-14

# Inherit from
FROM mreschke/debian:stretch
LABEL maintainer="mail@mreschke.com"

# Set environment
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

# Prepair nodejs for installation
RUN curl -o install https://deb.nodesource.com/setup_10.x && bash install

# Install some applications
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates \
    nodejs dos2unix unzip

# Add sury.org PHP repositories
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    sh -c 'echo "deb https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list' && \
    apt-get update

# Install all PHP 7.1 packages from sury.org
RUN apt-get install -y php7.1 php7.1-bcmath php7.1-bz2 php7.1-cgi php7.1-cli php7.1-common php7.1-curl \
    php7.1-dba php7.1-dev php7.1-enchant php7.1-fpm php7.1-gd php7.1-gmp php7.1-imap php7.1-interbase \
    php7.1-intl php7.1-json php7.1-ldap php7.1-mbstring php7.1-mcrypt php7.1-mysql php7.1-odbc php7.1-opcache \
    php7.1-pgsql php7.1-phpdbg php7.1-pspell php7.1-readline php7.1-recode php7.1-snmp php7.1-soap php7.1-sqlite3 \
    php7.1-sybase php7.1-tidy php7.1-xml php7.1-xmlrpc php7.1-xsl php7.1-zip

# Install PHP Composer Package Manager
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Create a /run/php folder required for php-fpm
RUN mkdir -p /run/php

# Configure PHP
COPY files/cli/php.ini /etc/php/7.1/cli/php.ini
COPY files/fpm/php.ini /etc/php/7.1/fpm/php.ini
COPY files/fpm/pool.d/www.conf /etc/php/7.1/fpm/pool.d/www.conf

# By default we run php-fpm on port 9000 as defined in our www.conf
CMD php-fpm7.1 --nodaemonize --allow-to-run-as-root
