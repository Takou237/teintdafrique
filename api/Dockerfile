FROM php:8.2-apache

# AH00534 « More than one MPM loaded » : ne garder QUE mpm_prefork.
# Suppression directe et déterministe des symlinks des autres MPM (event/worker),
# puis ré-activation explicite de prefork.
RUN a2enmod rewrite \
    && rm -f /etc/apache2/mods-enabled/mpm_event.load /etc/apache2/mods-enabled/mpm_event.conf \
           /etc/apache2/mods-enabled/mpm_worker.load /etc/apache2/mods-enabled/mpm_worker.conf \
    && a2enmod mpm_prefork \
    && sed -ri 's/AllowOverride\s+None/AllowOverride All/g' /etc/apache2/apache2.conf

# Copier tout le contenu du dossier api dans le serveur web
COPY . /var/www/html/

# Donner les permissions nécessaires
RUN chown -R www-data:www-data /var/www/html

# Exposer le port 80
EXPOSE 80