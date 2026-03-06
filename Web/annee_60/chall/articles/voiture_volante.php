<?php
// Path Traversal volontaire
if (isset($_GET['img'])) {
    $file = '../images/' . $_GET['img'];
    header('Content-Type: image/jpeg');
    readfile($file);
    exit;
}
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>La Voiture Volante Familiale</title>
<style>
body{font-family:'Courier New',monospace;background:#f4f0df;padding:40px;line-height:1.7;}
h1{font-size:30px;text-transform:uppercase;}
.date{font-size:14px;margin-bottom:25px;color:#444;}
.back{display:inline-block;margin-bottom:25px;padding:6px 12px;background:#ddd;border:2px solid #000;color:#000;text-decoration:none;}
img{border:3px solid #000;box-shadow:5px 5px 0 #000;margin-bottom:25px;}
</style>
</head>
<body>

<a class="back" href="../index.php">← Retour</a>
<div class="date">Édition du 9 novembre 1964</div>

<h1>La Voiture Volante Familiale</h1>

<img src="voiture_volante.php?img=voiture_volante.jpg" width="420">

<p>
Les ingénieurs aéronautiques présentent cette saison un nouveau prototype qui attire particulièrement l’attention : un véhicule hybride capable d’assurer aussi bien la conduite sur route que le vol sur courtes distances. L’appareil reprend la structure d’une automobile compacte, à laquelle est solidement fixé un ensemble complet d’ailes et de surfaces de contrôle inspirées de l’aviation légère.
</p>

<p>
Les premiers essais démontrent une stabilité remarquable lors des phases de décollage et d’atterrissage, rendue possible grâce à une motorisation combinée et à une répartition soigneusement étudiée des masses. Les pilotes d’essai rapportent que la transition entre la conduite au sol et le vol s’effectue avec une aisance surprenante, comparable à celle des appareils d’entraînement civils.
</p>

<p>
Ce modèle marque une étape importante dans le développement des véhicules aériens individuels. Plusieurs bureaux d’étude considèrent déjà ce type de configuration, automobile à fuselage intégré et ailes démontables, comme la solution la plus réaliste pour rendre la mobilité aérienne accessible aux familles modernes. Si les coûts et la formation des futurs utilisateurs restent des sujets à l’étude, le prototype démontre clairement que la voiture volante n’appartient plus uniquement aux spéculations : elle devient une possibilité concrète.
</p>

</body>
</html>
