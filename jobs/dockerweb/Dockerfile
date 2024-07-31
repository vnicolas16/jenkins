FROM php:7.1.17-apache
LABEL maintainer="Jaivic"

# Enable Apache rewrite module
RUN a2enmod rewrite

# Install necessary packages and PHP extensions
RUN apt-get update && apt-get install -y \
        zlib1g-dev \
        libicu-dev \
        libxml2-dev \
        libpq-dev \
        libzip-dev && \
    docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && \
    docker-php-ext-install pdo pdo_mysql pdo_pgsql zip intl xmlrpc soap opcache && \
    docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd && \
    apt-get install vim -y && \
    rm -rf /var/lib/apt/lists/*  # Clean up the apt cache

# Copy application files
COPY . /var/www/html/
WORKDIR /var/www/html/
