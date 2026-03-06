<?php
// Protection : On empêche le navigateur d'interpréter le contenu comme du HTML (lutte contre XSS)
header('Content-Type: text/plain; charset=utf-8');
// Protection : On empêche ce script d'être chargé dans une iframe (Clickjacking)
header('X-Frame-Options: DENY');

// Configuration des identifiants (En réalité, le mot de passe devrait être hashé)
$valid_user = 'eusebius';
$valid_pass = '7hU6Pm9po9';

// 1. Vérification de la méthode
if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    http_response_code(405);
    exit("Erreur : Seule la méthode GET est autorisée.");
}


$user = filter_input(INPUT_GET, 'username', FILTER_SANITIZE_SPECIAL_CHARS);

$user = trim($user);

// RÉCUPÉRATION du mot de passe
$pass = filter_input(INPUT_GET, 'password', FILTER_SANITIZE_SPECIAL_CHARS);

// On supprime aussi les espaces inutiles avant/après
$pass = trim($pass);

// Vérification basique que les champs ne sont pas vides
if (empty($user) || empty($pass)) {
    http_response_code(400); // Bad Request
    exit("Erreur : Identifiants manquants.");
}

// 4. COMPARAISON SÉCURISÉE (Contre les attaques temporelles)
// hash_equals compare les chaînes en un temps constant, peu importe où se trouve la différence.
// Cela empêche les hackers de deviner le mot de passe lettre par lettre en mesurant le temps de réponse.
if (hash_equals($valid_user, $user) && hash_equals($valid_pass, $pass)) {
    echo "ENI{Fl4g_LeC0uL0ir_Du_T3MPS}";
} else {
    http_response_code(403);
    echo "Utilisateur ou mot de passe incorrecte";
}
?>
