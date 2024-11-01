FROM php:8.2.11-fpm

# Install composer
RUN echo "\e[1;33mInstall COMPOSER\e[0m"
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Install useful tools and dependencies
RUN apt-get update && apt-get -y install --no-install-recommends \
    apt-utils \
    nano \
    wget \
    vim \
    git \
    unzip \
    zip \
    libcurl4-openssl-dev \
    libzip-dev \
    libpq-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libicu-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql pdo_pgsql zip intl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
&& apt-get install -y nodejs \
&& npm install -g npm@latest

# Set working directory
WORKDIR /var/www

# Copy composer files and install dependencies
COPY . /var/www

# Install Composer dependencies
RUN composer install --no-dev --optimize-autoloader


# Install Node.js dependencies
RUN npm install -g yarn
RUN yarn install
RUN yarn build

# Copy the rest of the application code
COPY . /var/www

# Set correct permissions for Laravel
RUN chown -R www-data:www-data /var/www \
    && chmod -R 777 /var/www/storage \
    && chmod -R 755 /var/www/bootstrap/cache

# Expose port 9000 and start PHP-FPM
EXPOSE 8000


# CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
#sama aja dengan yang bawah
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
