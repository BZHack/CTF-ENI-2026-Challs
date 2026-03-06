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

<h2>Panneau d'administration</h2>

<?php

@include('config.php');

?>
<div class="form-card">
	<form name="form_login_admpan" id="form_login_admpan" method="post" action="<?php echo $_SERVER['REQUEST_URI']; ?>">
	  <label for="f_login">Identifiant : </label><input type="text" name="f_login" id="f_login" placeholder="Votre login" value="" size="20" /><br />
	  <label for="f_pass">Mot de passe : </label><input type="password" name="f_pass" id="f_pass" size="20" placeholder="Votre mot de passe" value="" /><br />
	  <input type="submit" name="login_submit" value="Valider" />
	</form>

	<?php

		if(count($_POST) > 0)
		{
		echo "<span id=\"form_error\">Erreur d'authentification</span>";
		}
	?>
</div>

<footer>Copyright &copy; Voyageurs du temps</footer>
</body>
</html>
