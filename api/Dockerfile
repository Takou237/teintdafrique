FROM php:8.2-cli

# Backend PHP de l'API — servi par le serveur PHP intégré (php -S + router.php).
# Robuste sur Railway : pas d'Apache, donc pas de problème de MPM (AH00534).
#
# Railway peut construire l'image depuis la racine du dépôt (défaut) ou depuis
# le dossier api/ (réglage « Root Directory »). On copie le contexte tel quel,
# puis on normalise : l'API doit finir dans /var/www/html avec router.php à sa racine.
COPY . /app
RUN if [ -f /app/api/router.php ]; then mv /app/api /var/www/html; else mv /app /var/www/html; fi

WORKDIR /var/www/html

EXPOSE 8080

CMD ["php", "-d", "upload_max_filesize=6M", "-d", "post_max_size=8M", "-S", "0.0.0.0:8080", "-t", "/var/www/html", "/var/www/html/router.php"]
