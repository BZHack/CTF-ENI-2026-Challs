<header>
    <h1>Contactez-nous</h1>
    <p>
        Une question temporelle, une anomalie d&eacute;tect&eacute;e ou un projet hors du temps ?
        Le si&egrave;ge chronologique vous r&eacute;pond.
    </p>
</header>

<section>
    <h2>Formulaire de contact &amp; coordonn&eacute;es</h2>

    <div class="contact-grid">

        <div class="office">
            <img src="images/siege_societe.jpg" alt="Bâtiment de Voyageurs du temps">
            <div class="office-content">
                <p><strong>Voyageurs du Temps – Si&egrave;ge Chronologique</strong></p>
                <p>
                    88 Rue Marty McFly<br>
                    99200 Chronopolis, France
                </p>
                <p>+33 9 99 99 42 42</p>
                <p>
                    Ce b&acirc;timent est prot&eacute;g&eacute; par des champs de stabilisation
                    chronologique garantissant une continuit&eacute; temporelle optimale.
                </p>

                <div class="map">
                    <img src="images/carte_chronopolis.png" style="width: 489px; height: 320px;" alt="Carte du si&egrave;ge de Voyageurs du temps" />
                </div>
            </div>
        </div>

<?php

$p_name = null;
$p_email = null;
$p_subject = null;
$p_message = null;

if(isset($_POST['name']))
{
$p_name = htmlentities(strip_tags($_POST['name']));
}

if(isset($_POST['email']))
{
$p_email = htmlentities(strip_tags($_POST['email']));
}

if(isset($_POST['subject']))
{
$p_subject = htmlentities(strip_tags($_POST['subject']));
}

if(isset($_POST['message']))
{
$p_message = htmlentities(strip_tags($_POST['message']));
}

?>

        <div class="form-card">
            <form method="post" name="contact_form" id="contact_form" enctype="multipart/form-data" action="<?php echo $_SERVER['REQUEST_URI']; ?>">
                <label for="name">Nom complet</label>
                <input type="text" id="name" name="name" placeholder="Votre nom" value="<?php echo $p_name; ?>" required>

                <label for="email">Adresse email</label>
                <input type="email" id="email" name="email" placeholder="votre@email.fr" value="<?php echo $p_email; ?>" required>

                <label for="subject">Sujet</label>
                <input type="text" id="subject" name="subject" placeholder="Objet de votre message" value="<?php echo $p_subject; ?>" required>

                <label for="message">Message</label>
                <textarea id="message" name="message" placeholder="Décrivez votre demande temporelle..." required><?php echo $p_message; ?></textarea>

                <button type="submit">Envoyer le message</button>
            </form>

			<?php
				if(!empty($p_name) && !empty($p_email) && !empty($p_subject) && !empty($p_message))
				{
				echo "<span id=\"form_send\">Votre message a &eacute;t&eacute; envoy&eacute;.</span>";
				}
			?>
        </div>

    </div>
</section>
