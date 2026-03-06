<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chroniques du Futur – Édition 1965</title>
<style>
    body { font-family: 'Courier New', monospace; background:#f4f0df; padding:40px; }
    h1 { text-align:center; font-size:32px; color:#2a2a2a; letter-spacing:2px; }

    .articles {
        display:flex;
        gap:30px;
        justify-content:center;
        margin-top:40px;
    }

    .card {
        width:280px; background:#fff;
        border:3px solid #000; padding:15px;
        box-shadow:6px 6px 0 #000;
        text-align:center;
    }

    /* Cadre uniforme */
    .img-frame {
        width:100%;
        height:180px; /* hauteur fixe */
        border:1px solid #000;
        overflow:hidden;
        margin-bottom:10px;
        background:#e3e0d1;
    }

    /* Image recadrée proprement */
    .img-frame img {
        width:100%;
        height:100%;
        object-fit:cover; /* Remplit sans déformation */
        display:block;
    }

    .card h3 { font-size:20px; margin-top:10px; }
    .card a { text-decoration:none; color:#000; }
</style>
</head>
<body>

<h1>Chroniques du Futur – 1965</h1>

<div class="articles">

    <div class="card">
        <a href="articles/maisons_auto.php">
            <div class="img-frame">
                <img src="images/maisons_auto.jpg">
            </div>
            <h3>La Maison Automatisée</h3>
            <p>Le foyer du futur selon General Electric.</p>
        </a>
    </div>

    <div class="card">
        <a href="articles/voiture_volante.php">
            <div class="img-frame">
                <img src="images/voiture_volante.jpg">
            </div>
            <h3>La Voiture Volante</h3>
            <p>La voiture qui promet de passer de la route au ciel.</p>
        </a>
    </div>

    <div class="card">
        <a href="articles/food_pill.php">
            <div class="img-frame">
                <img src="images/food_pill.jpg">
            </div>
            <h3>Les Food Sticks</h3>
            <p>Nutrition du Futur.</p>
        </a>
    </div>

</div>

</body>
</html>
