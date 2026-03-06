<?php
if (!isset($_GET['token'])) {
    http_response_code(404);
    exit;
}
$token = $_GET['token'];
if (!preg_match('/^[A-Fa-f0-9]{32}$/', $token)) {
    http_response_code(400);
    echo json_encode(['error'=>'token invalide']);
    exit;
}

$hex_ts = substr($token, 16, 8);
$timestamp = hexdec($hex_ts);
$dir = __DIR__ . '/archives';
$files = array_diff(scandir($dir), ['.', '..']);

foreach ($files as $file) {
    $path = "$dir/$file";
    if (!is_file($path)) continue;
    if (filemtime($path) === $timestamp) {
        $stat = stat($path);
        //printf($stat);
        $details = [
            'name' => $file,
            'directory' => realpath($dir),
            'size' => round($stat['size'] / 1024, 2) . ' Ko',
            'date_creation' => date('Y-m-d H:i:s', filemtime($path)),
            'date_modification' => date('Y-m-d H:i:s', $stat['mtime']),
            'date_access' => date('Y-m-d H:i:s', $stat['atime']),
            'rights' => substr(sprintf('%o', fileperms($path)), -4),
            'user_id' => $stat['uid'],
            'group_id' => $stat['gid'],
            'owner' => posix_getpwuid($stat['uid'])['name'] ?? 'unknown',
            'group' => posix_getgrgid($stat['gid'])['name'] ?? 'unknown',
            'token' => $token
        ];

        // téléchargement
        if (isset($_GET['download']) && $_GET['download'] == '1') {
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename="'.basename($path).'"');
            header('Content-Length: ' . filesize($path));
            readfile($path);
            exit;
        }

        header('Content-Type: application/json');
        echo json_encode($details, JSON_PRETTY_PRINT);
        exit;
    }
}

http_response_code(404);
echo json_encode(['error'=>'Fichier non trouvé']);
