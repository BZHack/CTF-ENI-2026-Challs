#!/bin/bash

# Script de création du challenge CTF Git - Time Machine
# Thème: Retour vers le futur

set -e

REPO_NAME="time-travel-app"

echo "🕐 Création du challenge Git Time Machine..."

# Nettoyage si le repo existe déjà
sudo rm -rf $REPO_NAME
mkdir $REPO_NAME
cd $REPO_NAME

# Initialisation du repo
git init
git config user.name "Doc Brown"
git config user.email "doc.brown@hill-valley.com"

echo "📁 Création de la structure de base..."

# ====== COMMIT 1 ======
echo "📝 Commit 1 - First commit..."

# index.html
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Machine Temporelle</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>🕐 Machine Temporelle</h1>
        <p>Bienvenue dans le système de contrôle</p>
    </div>
    <script src="app.js"></script>
</body>
</html>
EOF

# style.css
cat > style.css << 'EOF'
body {
    font-family: Arial, sans-serif;
    background: #667eea;
    color: white;
    padding: 20px;
}

.container {
    max-width: 800px;
    margin: 0 auto;
    background: rgba(0, 0, 0, 0.3);
    padding: 30px;
    border-radius: 10px;
}
EOF

# app.js
cat > app.js << 'EOF'
console.log('Machine Temporelle initialisée');
console.log('Année cible: 1985');
EOF

# admin.html
cat > admin.html << 'EOF'
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Administration</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>🔐 Panneau Admin</h1>
        <p>Accès restreint</p>
    </div>
</body>
</html>
EOF

# docker-compose.yml avec FLAG1
cat > docker-compose.yml << 'EOF'
version: '3.8'

services:
  web:
    image: nginx:alpine
    ports:
      - "8080:80"
    volumes:
      - ./:/usr/share/nginx/html
    environment:
      - FLAG1=ENI{2001_Flux_C@p@citor}
EOF

git add .
git commit -m "Commit initial (POC)"

echo "✅ Commit 1 créé - FLAG1 en clair"

# ====== COMMIT 2 ======
echo "🔐 Commit 2 - First release..."

# Modifier docker-compose.yml
cat > docker-compose.yml << 'EOF'
version: '3.8'

services:
  web:
    image: nginx:alpine
    ports:
      - "8080:80"
    volumes:
      - ./:/usr/share/nginx/html
    # FLAG1=ENI{removed_because_not_secured}  # removed for security concerns
    env_file:
      - .env
EOF

# Créer .env avec FLAG2 en base64 (sans padding =)
FLAG2_B64=$(echo -n "ENI{2002_Hill_V@lley_1955}" | base64)

cat > .env << EOF
APP_TITLE=Machine Temporelle
APP_VERSION=1.0.0
FLAG2=$FLAG2_B64
MAX_TRAVEL_YEARS_BACK=100
EOF

# Modifications mineures dans les fichiers
sed -i 's/Année cible: 1985/Année cible: 1955/' app.js
sed -i 's/padding: 20px;/padding: 20px;\n    min-height: 100vh;/' style.css
sed -i 's/Bienvenue dans le système de contrôle/Bienvenue dans le système de contrôle de la machine temporelle/' index.html

git add .
git commit -m "Beta - Amélioration de la sécurité - changements mineurs"

echo "✅ Commit 2 créé - FLAG2 en base64 dans .env"

# ====== COMMITS MINEURS ======
echo "📝 Commits mineurs..."

# Commit 3 : Add CLUF
cat > cluf.html << 'EOF'
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Conditions d'utilisation</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>CLUF</h1>
        <p>Vous acceptez de ne pas modifier le continuum espace-temps.</p>
    </div>
</body>
</html>
EOF

sed -i 's|</div>|    <footer><a href="cluf.html">Conditions</a></footer>\n    </div>|' index.html

git add .
git commit -m "Ajout CLUF"

# Commit 4 : Chore code cleanup
sed -i '1i// Machine Temporelle - Application principale' app.js
sed -i 's/Arial/'"'"'Courier New'"'"'/' style.css

git add .
git commit -m "Nettoyage du code - Ajout de commentaires"

echo "✅ Commits mineurs créés"

# ====== COMMIT AVEC API KEY (qui sera squashé) ======
echo "🔑 Commit avec API Key..."

# Modifier .env pour changer FLAG2 vers "Removed for security concerns"
FLAG2_REMOVED_B64=$(echo -n "Removed for security concerns" | base64)

cat > .env << EOF
APP_TITLE=Machine Temporelle
APP_VERSION=1.0.0
FLAG2=$FLAG2_REMOVED_B64
MAX_TRAVEL_YEARS_BACK=100
EOF

# Créer api.key avec FLAG3
cat > api.key << 'EOF'
FLAG3=ENI{2003_Hoverbo@rd}
EOF

git add .
git commit -m "Added API Key functionality"

echo "✅ Commit API Key créé - FLAG3 dans api.key"

# ====== SIMULATION SENIOR DEV - SQUASH DU COMMIT ======
echo "👨‍💼 Simulation senior dev - Squash du commit..."

# Reset soft pour annuler le dernier commit mais garder les changements
git reset --soft HEAD~1

# Supprimer le fichier api.key
rm -f api.key

# On garde le .env avec FLAG2="Removed for security concerns"
# (pas de restauration de l'ancien FLAG2)

# Ajouter uniquement les modifications tracked (pas api.key)
git add -u

# Commit vide avec message du senior
git commit --allow-empty -m "On a viré l'interne qui met les clés api dans GIT !!! (Et son commit)"

echo "✅ Commit squashé - api.key supprimé, FLAG2 reste 'Removed for security concerns'"

# ====== COMMIT FINAL ======
echo "📝 Commit final..."

# Modifier index.html
sed -i 's/Machine Temporelle/Machine Temporelle v2.0/' index.html
sed -i 's/<p>Bienvenue/<p>Nouvelle interface\n        <p>Bienvenue/' index.html
sed -i '/<\/body>/d' index.html
cat >> index.html << 'EOF'
    <p>Contactez-nous via le formulaire</p>
</body>
</html>
EOF

# Ajouter contact.html
cat > contact.html << 'EOF'
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Contact</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>Contact</h1>
        <form>
            <input type="email" placeholder="Email">
            <textarea placeholder="Message"></textarea>
            <button>Envoyer</button>
        </form>
    </div>
</body>
</html>
EOF

git add .
git commit -m "Ajout formulaire de contact"

echo "✅ Commit final créé"

echo ""
echo "🎉 Challenge CTF créé avec succès!"
echo ""
echo "📊 Historique des commits:"
git log --oneline
echo ""
echo "🎯 Résumé des flags:"
echo "   FLAG1: Dans docker-compose.yml du premier commit"
echo "   FLAG2: Dans .env (base64) du deuxième commit"
echo "   FLAG3: Dans le commit 'Added API Key functionality' qui a été squashé"
echo ""
echo "🔍 Pour trouver FLAG3, il faut utiliser git reflog pour retrouver le commit squashé"
echo ""
echo "📝 Le repo est prêt dans: $REPO_NAME"
