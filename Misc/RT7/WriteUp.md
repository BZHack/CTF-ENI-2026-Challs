# Write-Up : R47-Jail

## Ennoncé
Un sursaut temporel a été détecté dans un secteur isolé de l’espace.
Vous êtes envoyé pour l’examiner.

À votre arrivée, vous contactez la base :
  > Vous :
  > « CTFplayer sur zone. Je vois une geôle flottante… L’inscription dessus est illisible, c'est comme si elle bougeait, peut‑être R▮T▮7 »

La réponse de la base vous parvient :
  > Base :
  > « Atrsto d pusir livsiain bne cac CFlyr »

Vous êtes seul


## Analyse & Indices
Le challenge nous place face à un service inconnu.
Les indices fournis nous orientent vers deux concepts clés :
1.  **ROT47** : L'énoncé contient "R▮T▮7".
2.  **Un caractère sur deux** : La réponse étrange de la base "Atrsto d pusir..." suggère qu'une partie du message a été supprimée ou altérée.

En analysant le fonctionnement, on comprend que le serveur :
1.  Prend l'entrée utilisateur.
2.  Applique ROT47.
3.  Supprime un caractère sur deux.
4.  Exécute le résultat dans un shell.

## Shell Restreint (rbash)
Une fois connecté, on se rend compte que l'environnement est restreint.
L'utilisateur est dans un **rbash** (Restricted Bash).
Si on regarde le `$PATH` :
```bash
echo $PATH
# /home/ctfplayer/
```
Seuls quelques binaires sont présents : `ls`, `echo`, `pwd`, `mknod`, `ionice`, `su`.
Commandes comme `cat`, `bin`, `/bin/sh` sont inaccessibles ou bloquées.

## Solutions

**Boucle echo :**
```bash
while IFS= read -r ligne; do echo "$ligne"; done < /home/ctfplayer/flag
```

### Méthode 1 : Netcat (Manuelle)
On peut forger la payload à la main pour contourner le filtre "un caractère sur deux" en insérant des caractères poubelles, puis en appliquant ROT47.
Puisqu'on n'a pas `cat`, on utilise les builtins de bash pour lire le flag.

*Payload encodée (ROT47 + Padding) :*
```text
H·9·:·=·6· ·x·u·$·l· ·C·6·2·5· ·\·C· ·=·:·8·?·6·j· ·5·@· ·6·4·9·@· ·Q·S·=·:·8·?·6·Q·j· ·5·@·?·6· ·k· ·^·9·@·>·6·^·4·E·7·A·=·2·J·6·C·^·7·=·2·8
```
*(Les points médians `·` représentent ici les caractères ignorés/poubelles nécessaires pour survivre au filtre `s[0::2]`)*.

### Méthode 2 : Script Python
On peut écrire un script `solve.py` qui automatise l'encodage et nous offre un shell interactif transparent.

```python
from rot47 import encode, decode
import socket

host = "challenge.ctf"
port = 5000

cmd = "cat /flag"
msg = encode(cmd) + "\n"

s = socket.create_connection((host, port))
s.sendall(msg.encode())
resp = decode(s.recv(4096).decode().strip())
s.close()

print(resp)
```

Une fois le shell interactif obtenu, on tape la même boucle `while` pour lire le flag.

```bash
while IFS= read -r ligne; do echo "$ligne"; done < /home/ctfplayer/flag
```
