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
<title>La Maison Automatisée</title>
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
<div class="date">Édition du 12 avril 1965</div>

<h1>La Maison Automatisée</h1>

<img src="maisons_auto.php?img=maisons_auto.jpg" width="420">

<p>
Les fabricants dévoilent aujourd’hui des démonstrateurs complets de foyers entièrement automatisés. Les visiteurs
des salons technologiques peuvent découvrir des cuisines où les relais électromécaniques et les minuteries programmables
gèrent déjà une bonne partie des tâches quotidiennes.
</p>

<p>
Les fours régulent automatiquement leur température, les réfrigérateurs surveillent les réserves grâce à des capteurs
de poids, et plusieurs appareils reçoivent leurs instructions via de simples bandes perforées. La préparation des repas
devient un processus prévisible et presque entièrement automatisé.
</p>

<p>
Dans toutes les démonstrations, on retrouve aussi des volets à commande électrique, un éclairage qui ajuste son
intensité selon la lumière extérieure et un réseau d’interphones reliant chaque pièce. Les ingénieurs affirment que
ces équipements seront bientôt incontournables dans tout foyer moderne.
</p>

</body>
</html>
