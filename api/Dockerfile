FROM php:8.2-cli

# Backend PHP de l'API — servi par le serveur PHP intégré (php -S + router.php).
# Robuste sur Railway : pas d'Apache, donc pas de problème de MPM (AH00534).
COPY . /var/www/html/
WORKDIR /var/www/html

EXPOSE 8080

CMD ["php", "-d", "upload_max_filesize=6M", "-d", "post_max_size=8M", "-S", "0.0.0.0:8080", "-t", "/var/www/html", "/var/www/html/router.php"]