FROM php:7.4-apache

RUN apt-get update && apt-get install -y \
    git \
    zip \
    curl \
    sudo \
    unzip \
    libicu-dev \
    libbz2-dev \
    libpng-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libreadline-dev \
    libfreetype6-dev \
    g++

RUN docker-php-ext-install \
    bz2 \
    intl \
    iconv \
    bcmath \
    opcache \
    calendar \
    pdo_mysql


RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app
COPY . /app
RUN chown -R www-data.www-data /app
RUN chmod -R 755 /app
RUN chmod -R 777 /app/storage
RUN mv .env.example .env

COPY vhost.conf /etc/apache2/sites-available/000-default.conf

RUN composer install --prefer-dist --no-ansi --no-dev
RUN php artisan key:generate

EXPOSE 80
RUN a2enmod rewrite
RUN service apache2 stop
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]