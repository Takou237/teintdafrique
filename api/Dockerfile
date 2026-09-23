FROM php:8.2-apache

# Ne garder qu'un seul module MPM (mpm_prefork) : si plusieurs MPM sont chargés
# (event/worker + prefork), Apache refuse de démarrer avec AH00534.
# Active aussi la réécriture d'URL et autorise les .htaccess (rewrite /api -> racine).
RUN a2enmod rewrite \
    && (a2dismod -f mpm_event 2>/dev/null || true) \
    && (a2dismod -f mpm_worker 2>/dev/null || true) \
    && a2enmod mpm_prefork \
    && sed -ri 's/AllowOverride\s+None/AllowOverride All/g' /etc/apache2/apache2.conf

# Copier tout le contenu du dossier api dans le serveur web
COPY . /var/www/html/

# Donner les permissions nécessaires
RUN chown -R www-data:www-data /var/www/html

# Exposer le port 80
EXPOSE 80