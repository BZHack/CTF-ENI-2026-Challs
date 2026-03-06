<?php
// Initialisation des variables
$error = null;
$email_value = '';

// Vérifie si le formulaire a été soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Récupération de l'email pour le ré-afficher (UX standard)
    $email_value = htmlspecialchars($_POST['email']);

    // Simulation d'un temps de réponse serveur (1 seconde) pour le réalisme
    sleep(1);

    // On force le message d'erreur demandé, peu importe les identifiants
    $error = "Méthode non autorisée";
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Machine à explorer le temps</title>
    <style>
        /* --- STYLE CSS (Identique à la version précédente) --- */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); /* Variante Bleu Profond */
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .login-card h2 {
            margin-bottom: 25px;
            color: #1e3c72;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .input-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-size: 0.9em;
            font-weight: 600;
        }

        .input-group input {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e1e1e1;
            border-radius: 8px;
            outline: none;
            transition: all 0.3s;
            font-size: 1em;
        }

        .input-group input:focus {
            border-color: #2a5298;
            box-shadow: 0 0 0 3px rgba(42, 82, 152, 0.1);
        }

        button {
            width: 100%;
            padding: 14px;
            background: #1e3c72;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1em;
            cursor: pointer;
            transition: background 0.3s;
            font-weight: bold;
            margin-top: 10px;
        }

        button:hover {
            background: #162d55;
        }

        /* Message d'erreur */
        .error-message {
            margin-top: 25px;
            padding: 12px;
            border-radius: 8px;
            background-color: #fef2f2;
            color: #991b1b;
            font-size: 0.95em;
            border: 1px solid #f87171;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .error-icon {
            margin-right: 8px;
            font-size: 1.2em;
        }

        /* Animation d'apparition + secousse */
        .shake-in {
            animation: shake 0.5s cubic-bezier(.36,.07,.19,.97) both;
        }

        @keyframes shake {
            10%, 90% { transform: translate3d(-1px, 0, 0); }
            20%, 80% { transform: translate3d(2px, 0, 0); }
            30%, 50%, 70% { transform: translate3d(-4px, 0, 0); }
            40%, 60% { transform: translate3d(4px, 0, 0); }
        }
    </style>
</head>
<body>

    <div class="login-card">
        <h2>Espace de configuration de la machine à explorer</h2>

        <form method="POST" action="">
            <div class="input-group">
                <label for="email">Identifiant</label>
                <input type="text" id="email" name="email" value="<?php echo $email_value; ?>" placeholder="user" required>
            </div>
            <div class="input-group">
                <label for="password">Mot de passe</label>
                <input type="password" id="password" name="password" placeholder="••••••••" required>
            </div>
            <button type="submit">Connexion</button>
        </form>

        <?php if ($error): ?>
            <div class="error-message shake-in">
                <span class="error-icon">🚫</span>
                <strong>Erreur 405 :</strong>&nbsp;<?php echo $error; ?>
            </div>
        <?php endif; ?>
    </div>

</body>
</html>
