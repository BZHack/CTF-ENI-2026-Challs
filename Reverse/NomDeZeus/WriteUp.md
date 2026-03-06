# WriteUp : Nom de Zeus

## Enonce
Nom de Zeus, Marty ! On doit repartir immédiatement, mais le convecteur temporel est verrouillé ! J'avais codé une sécurité pour éviter qu'on ne vole la DeLorean, mais impossible de remettre la main sur le code source. Il ne reste que ce binaire compilé. Retrouve le mot de passe avant que le continuum espace-temps ne s'effondre !

## Solution
Télécharger le fichier binaire `nom_de_zeus`.
Ouvrir un terminal.
Utiliser la commande `strings`, qui extrait les séquences de caractères imprimables.
Filtrer avec `grep` pour trouver le format du flag (ENI).
```
strings nom_de_zeus | grep ENI
ENI{221_Gigowatts!}
```
## Solution 2
Décompiler avec ghidra
Symbol Tree > Functions > main > le flag est en dur :
```
local_10 = ENI{221_Gigowatts!}";
```
## Hint
Marty, réfléchis ! Même sans le code source, le binaire contient encore des traces lisibles. Il suffit de tirer les bonnes ficelles pour voir ce qui est écrit en clair !
