# Challenge

## Enonce
L'administrateur de la société Voyageurs du temps a mis en ligne le nouvel environnement Web de la société. Mais est-il vraiment sécurisé ? Le mot de passe de l'administrateur sera le flag.

## Solution
Le site présente plusieurs pages, dont un formulaire de contact. Il peut être tentant de s'attarder sur ce dernier, mais la faille n'est pas ici. Intéressons-nous au menu. Une entrée de ce dernier permet d'accéder à l'intranet. C'est ici que se cache la vulnérabilité qu'il faut exploiter. Ce lien inclut un autre "site". Si nous regardons d'un peu plus près l'URL, nous remarquons un paramètre "site" qui comporte une chaîne de caractère finissant par deux symboles "=". Vous aurez certainement reconnu du base64, destiné à cacher une information. Nous allons utiliser notre ami CyberChef (https://gchq.github.io/CyberChef/) pour déterminer l'information que cette chaîne cache.

![image](src/wu_image1.png)

Il s'agit d'une URL interne. Retournons sur la page de l'intranet. En bas se trouve une rubrique "Liens internes". Un lien va nous intéresser : Panneau d'administration.

![image](src/wu_image2.png)

Le panneau d'administration est accessible par une URL interne, donc inaccessible de l'extérieur. Et si on détournait ce système d'inclusion pour accéder à ce panneau d'administration ? Copions le lien, et encodons-le en base64 (attention, il faudra supprimer le protocole (http://) du lien) grâce à CyberChef (il suffit pour cela de faire glisser "To Base64" de la colonne Operations vers Recipe (1) et de désactiver "From Base64" (2)).

![image](src/wu_image3.png)

Collons ensuite le résultat dans l'URL, à la place de la chaîne base64 déjà présente.

![image](src/wu_image4.png)

Nous accédons au panneau d'administration, qui nécessite une authentification, que nous n'avons pas. Cherchons une autre vulnérabilité. Vérifions si un fichier robots.txt est présent (valeur base64 YWRtaW5wYW4udm95YWdldXJzZHV0ZW1wcy5sb2NhbC9yb2JvdHMudHh0).

![image](src/wu_image4a.png)

Nous voyons qu'il est mentionné un dossier '/backup/' et un fichier 'config.php'. Un site ou une application utilise souvent une base de données, un fichier de configuration contenant les paramètres de connexion à cette base de données est généralement présent (souvent à la racine), nommé ici 'config.php'. Si nous ajoutons le fichier config.php dans la donnée à encoder dans CyberChef, et collons la nouvelle valeur base64 (YWRtaW5wYW4udm95YWdldXJzZHV0ZW1wcy5sb2NhbC9jb25maWcucGhw) dans l'URL, nous avons une page sans contenu (les autres noms de fichiers devraient afficher une erreur). Toutefois, si nous affichons le code source de la page, nous voyons qu'il est fait mention d'une configuration BDD en commentaire (probablement présente dans le fichier config.php).

![image](src/wu_image5.png)

Evidemment, le code PHP étant interprété au chargement de la page, nous ne pouvons pas y accéder. Mais peut-être y'a t'il une sauvegarde du fichier sous une autre extension (il est fréquent que la modification d'un fichier important soit précédée par une copie de fichier original pour le restaurer facilement). En essayant les extensions les plus courantes, nous obtenons un résultat avec config.php.old. Regardons à nouveau le code source, et là, miracle ! Des identifiants de connexion à la base de données sont présents (mais pas l'adresse du serveur de base de données, donc difficilement exploitable). Toutefois, deux lignes parlent d'un dump (sauvegarde de bases de données) à la fin du fichier, dont une comporte un chemin (vu précédemment dans le robots.txt). Il y a peut-être quelque chose à exploiter ici.

![image](src/wu_image6.png)

Tentons de voir si un fichier SQL est présent dans ce dossier en encodant ce chemin en base64 (YWRtaW5wYW4udm95YWdldXJzZHV0ZW1wcy5sb2NhbC9iYWNrdXAv) et collant cette nouvelle valeur dans l'URL. Nous obtenons une page listant les fichiers présents dans le dossier backup, dont un fichier backup.sql (laisser un tel fichier accessible depuis Internet est une mauvaise pratique).

![image](src/wu_image7.png)

Pour accéder au contenu du fichier, il est à nouveau nécessaire d'encoder le chemin en base64, ce qui donne YWRtaW5wYW4udm95YWdldXJzZHV0ZW1wcy5sb2NhbC9iYWNrdXAvYmFja3VwLnNxbA==. Si nous l'ouvrons par le biais du site Internet, nous obtenons le contenu du dump. Nous pouvons donc rechercher la requête SQL ajoutant le compte administrateur en base de données. Nous obtenons le hash md5 correspondant au mot de passe (il est possible de déterminer le type de hash avec le site https://hashes.com/en/tools/hash_identifier).

![image](src/wu_image8.png)
![image](src/wu_image9.png)

**Crackage du mot de passe**
Md5 est un algorithme de hashage (cet algorithme est déprécié, il est utilisé pour faciliter sa découverte). Le hash md5 n'est pas utilisable tel quel, cela permet juste à ne pas le stocker en clair. Un hash est une chaîne de caractères qui n'est pas réversible, il n'est donc pas possible de le "déhasher". Certains sites proposent toutefois des bases de hash md5, il suffit donc de rechercher le hash que nous avons pour connaître le mot de passe correspondant si le hash y est présent. Il faut parfois faire plusieurs sites pour trouver le mot de passe correspondant. Nous pouvons également utiliser un logiciel de crackage de mot de passe (les plus connus sont Hashcat et John the ripper).

Les sites de bases de hash :
- https://www.dcode.fr/md5-hash
- https://md5hashing.net/hash/md5/
- https://md5decrypt.net/

Notre hash n'est pas présent dans la base de dcode, mais il l'est sur les deux autres sites.

![image](src/wu_image_crack1.png)

Voici le résultat avec Hashcat et John the ripper avec la liste de mot de passe Rockyou :

![image](src/wu_image_crack_hashcat.png)
![image](src/wu_image_crack_john.png)

Commande Hashcat : hashcat -a 0 -m 0 --show ee35e7c782791419f29316f183d5d6d3 /usr/share/wordlists/rockyou.txt
-a : mode d'attaque
-m : algorithme utilisé pour la génération du hash. Le 0 correspond à md5.
--show : permet d'afficher le mot de passe dans le terminal

Commande John the ripper (il est nécessaire de stocker le hash dans un fichier texte) : john --format=raw-md5 hash-md5.txt --wordlist=/usr/share/wordlists/rockyou.txt
--format : algorithme de génération du hash

**Vulnérabilités utilisées**
La première vulnérabilité utilisée pour accéder aux fichiers du panneau d'administration est une SSRF (Server-Side Request Forgery). Elle est présente dans le Top10 OWASP (incluse dans Broken Access Control sur la version 2025), qui liste les 10 vulnérabilités les plus présentes dans les applications Web. Cela consiste à inclure une page HTTP dans une autre page afin de contourner une restriction d'accès (dans le cas du challenge, une page locale incluse dans une page accessible de l'extérieur).
https://owasp.org/Top10/2021/fr/A10_2021-Server-Side_Request_Forgery_%28SSRF%29/
https://cwe.mitre.org/data/definitions/918.html

La seconde vulnérabilité est la présence de fichiers sensibles et accessibles depuis l'extérieur (backup.sql, config.php.old). Il est important de ne pas laisser de tels fichiers dans un dossier accessible en HTTP, que ce soit depuis l'extérieur ou depuis l'intérieur. Cela pourrait permettre à une personne malintentionnée de récupérer un accès à hauts privilèges. La solution consiste à les déplacer dans un dossier à accès restreint (ACL) et surtout non accessible en HTTP (idéalement, positionné en dehors d'un dossier accessible en HTTP, ou à défaut, il faut restreindre l'accès en HTTP par une directive adaptée du serveur Web ou un WAF).

## Hints
  - "Intéressez-vous à l'intranet. Une erreur a été commise."
  - "Parfois, quand on modifie un fichier important, on renomme ou copie l'ancienne version pour pouvoir restaurer rapidement. On ne sait jamais, ça peut aider..."
