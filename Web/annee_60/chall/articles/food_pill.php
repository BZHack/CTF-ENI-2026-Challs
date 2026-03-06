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
<title>Les Food Sticks – Nutrition du Futur</title>
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
<div class="date">Édition du 18 janvier 1967</div>

<h1>Les Food Sticks – Nutrition du Futur</h1>

<img src="food_pill.php?img=food_pill.jpg" width="420">

<p>
Les chercheurs spécialisés dans la nutrition scientifique présentent aujourd’hui une nouvelle génération d’aliments
compressés destinés à faciliter la vie quotidienne : les <strong>Food Sticks</strong>. Ces barres compactes, développées
dans le cadre des programmes spatiaux, concentrent en un volume réduit toutes les valeurs énergétiques nécessaires pour
un repas complet.
</p>

<p>
Les équipes travaillant aux côtés des missions Gemini et Apollo démontrent que ces aliments peuvent être consommés
rapidement, sans préparation, et surtout dans des environnements où l’espace et le temps sont limités. Leur texture souple,
leur emballage hermétique et leur conservation exceptionnelle en font déjà une solution idéale pour les déplacements,
le travail en extérieur et les situations nécessitant une ingestion rapide de nutriments.
</p>

<p>
Plusieurs entreprises du secteur agroalimentaire étudient la possibilité de proposer ces barres au grand public. Selon
certains spécialistes, les Food Sticks pourraient devenir un produit courant dans les foyers modernes : un moyen simple,
pratique et propre de prendre un repas équilibré sans avoir à cuisiner ni à nettoyer quoi que ce soit.
</p>

</body>
</html>
