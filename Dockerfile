FROM php:8.3-apache

# Install necessary PHP extensions for MySQL connectivity
RUN apt-get update && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install pdo pdo_mysql && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get update && \
    apt-get install -y zip unzip git libzip-dev && \
    docker-php-ext-install zip

RUN docker-php-ext-install session

# Enable Apache modules - THIS IS THE KEY FIX
RUN a2enmod rewrite
RUN a2enmod headers

# Configure Apache for Railway's PORT environment variable
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

# Copy your PHP application code
COPY ./api/ /var/www/html/

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

EXPOSE 8080
