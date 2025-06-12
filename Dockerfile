# Use an official PHP image with Apache. Adjust the PHP version as needed.
# Example: php:8.2-apache, php:7.4-apache
FROM php:8.3-apache

# Install necessary PHP extensions for MySQL connectivity.
# Common extensions are mysqli or pdo_mysql.
# Update package list and install dependencies
RUN apt-get update && \
	docker-php-ext-install mysqli && \
	docker-php-ext-install pdo pdo_mysql && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get update && \
    apt-get install -y zip unzip git libzip-dev && \
    docker-php-ext-install zip



# You might need other extensions depending on your project (e.g., gd, zip)
# RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev zip unzip
# RUN docker-php-ext-configure gd --with-freetype --with-jpeg
# RUN docker-php-ext-install gd zip

# Enable Apache mods like rewrite (if needed)
RUN a2enmod rewrite

# Copy your PHP application code into the container's web root
# Adjust 'src/' if your PHP files are in a different directory (e.g., 'public/', './')
COPY ./api/ /var/www/html/

# Expose port 80 (Apache's default port)
EXPOSE 80
