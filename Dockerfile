FROM php:7.4-apache


RUN apt-get update && apt-get upgrade -y

# Install Postgre PDO
RUN apt-get install -y libpq-dev unzip \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql
    
    
    # Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#criando projeto versao lts 6
composer create-project laravel/laravel projeto --prefer-dist 6.0
