FROM php:8.2-apache

# Activer le module d'écriture d'URL Apache et autoriser les .htaccess
# (nécessaire pour le rewrite /api -> racine, voir .htaccess)
RUN a2enmod rewrite \
    && sed -ri 's/AllowOverride\s+None/AllowOverride All/g' /etc/apache2/apache2.conf

# Copier tout le contenu du dossier api dans le serveur web
COPY . /var/www/html/

# Donner les permissions nécessaires
RUN chown -R www-data:www-data /var/www/html

# Exposer le port 80
EXPOSE 80