FROM php:8.2-apache

# Activer le module d'écriture d'URL Apache si besoin
RUN a2enmod rewrite

# Copier tout le contenu du dossier api dans le serveur web
COPY . /var/www/html/

# Donner les permissions nécessaires
RUN chown -R www-data:www-data /var/www/html

# Exposer le port 80
EXPOSE 80