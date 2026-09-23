<?php
/**
 * Routeur du serveur PHP intégré (php -S) — exécuté sur chaque requête.
 *
 * Sur Railway le dossier api/ est la racine web, mais le front (Vercel) appelle
 * les routes avec le préfixe /api/ (voir src/lib/config.ts) : on retire ce préfixe
 * et on exécute le fichier .php correspondant. Les ressources statiques (uploads/...)
 * sont laissées au serveur intégré (return false).
 *
 * Réutilisable avec Apache+mod_php via .htaccess (rewrite ^api/(.*)$ /$1) : le routeur
 * n'est utilisé que par php -S.
 */

$uri = $_SERVER['REQUEST_URI'] ?? '/';
$path = rawurldecode((string)parse_url($uri, PHP_URL_PATH));

if (strpos($path, '/api/') === 0) {
    $docRoot = __DIR__;
    $relative = ltrim(substr($path, 4), '/');
    $target = $docRoot . '/' . $relative;

    $real = realpath($target);
    if (
        $real !== false
        && is_file($real)
        && !is_dir($real)
        && substr($real, -4) === '.php'
        && strpos($real, $docRoot) === 0
    ) {
        require $real;
        exit;
    }

    http_response_code(404);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['success' => false, 'error' => 'not_found'], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}

// Autres chemins (fichiers statiques, .php sans préfixe /api) : laisser php -S servir.
return false;