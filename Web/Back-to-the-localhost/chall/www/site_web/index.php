<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<title>Les voyageurs du temps, votre sp&eacute;cialiste du voyage temporel</title>

 <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>



<div id="logo"><img src="images/logo_transparent.png" width="400" height="157" alt="Les voyageurs du temps" /></div>

 <ul id="menu">
  <li><a href="index.php" class="active">Accueil</a></li>
  <li><a href="?i=actualites">Actualit&eacute;s</a></li>
  <li><a href="?i=contact">Contact</a></li>
  <li><a href="?i=intranet&amp;site=<?php echo base64_encode("intranet.voyageursdutemps.local"); ?>">Intranet</a></li>
  <li style="float:right"><a href="?i=apropos">A propos de nous</a></li>
</ul>

<?php

if(isset($_GET['i']))
{
$i = htmlentities(strip_tags($_GET['i']));
}
else
{
$i = null;
}

switch($i) {
	case "accueil":
		include('accueil.php');
		break;
	case "contact":
		include('contact.php');
		break;
	case "actualites":
		include('actualites.php');
		break;
	case "apropos":
		include('apropos.php');
		break;
	case "intranet":
		//include('http://intranet.voyageursdutemps.local/');
		include('inc_intra.php');
		break;
	default:
		include('accueil.php');
		break;
	}

?>

<footer>Copyright &copy; Voyageurs du temps</footer>
</body>
</html>
