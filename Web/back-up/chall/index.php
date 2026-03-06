<?php
$archiveDir = __DIR__ . '/archives';
$allEntries = array_diff(scandir($archiveDir), ['.', '..']);
$validFiles = [];

foreach ($allEntries as $filename) {
    if ($filename[0] === '.') continue;
    $fullPath = $archiveDir . '/' . $filename;
    if (is_file($fullPath)) {
        $validFiles[$filename] = filemtime($fullPath);
    }
}

arsort($validFiles);
$latestReports = array_slice(array_keys($validFiles), 0, 12);
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Rapports mensuels de maintenance</title>
    <link rel="stylesheet" href="./static/styles.css">
</head>
<body>
    <h2>Rapports mensuels de maintenance (12 derniers mois)</h2>
    <table id="reportsTable">
        <thead>
            <tr>
                <th>Nom du rapport</th>
                <th>Taille (Ko)</th>
                <th>Date (UTC)</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($latestReports as $fileName):
                $filePath = $archiveDir . '/' . $fileName;
                if (!file_exists($filePath)) continue;

                $fileSize = round(filesize($filePath) / 1024, 2);
                $timestamp = filemtime($filePath);
                $formattedDate = date('d/m/Y H:i:s', $timestamp);

                $hexStamp = strtoupper(str_pad(dechex($timestamp), 8, '0', STR_PAD_LEFT));
                $token = '51BF79CAA9480000' . $hexStamp . '00000037';
            ?>
            <tr onclick="showDetails('<?php echo $token; ?>')">
                <td><?php echo htmlspecialchars($fileName); ?></td>
                <td><?php echo $fileSize; ?></td>
                <td><?php echo $formattedDate; ?></td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <div id="modal">
        <div id="modal-content">
            <span id="close-btn" onclick="closeModal()">×</span>
            <pre id="fileDetails"></pre>
            <div id="downloadArea"></div>
        </div>
    </div>

    <script src="./static/script.js"></script>
</body>
</html>
