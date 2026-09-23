FROM php:8.2-apache

# Activer l'écriture d'URL Apache
RUN a2enmod rewrite

# Installer les extensions PHP pour se connecter à MySQL
RUN docker-php-ext-install pdo pdo_mysql mysqli

COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html
EXPOSE 80