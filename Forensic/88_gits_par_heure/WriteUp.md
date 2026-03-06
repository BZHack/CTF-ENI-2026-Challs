# Challenge
__88_gits par heure__
C'est un challenge basé sur un REPO GIT avec 3 flags classés par niveau
Il suffit de télécharger le zip, le dézipper et on obtien un repo GIT pour une app
Il faut avoir GIT sur son poste pour naviguer dans les commits... Sinon, c'est mort !

## Enonce
    Une équipe de DEV a créé une app pour vous aider à anticiper vos voyages dans le temps.
    Le projet est opensource et hébergé sur git.
    Les bonnes pratiques de sécurité ont-elle été respectée ?

    Note: Il y a 3 flags dans l'unique repo (zip) pour les 3 chall de la série
            - FLAG1 : 86 gits par heure
            - FLAG2 : 87 gits par heure
            - FLAG3 : 88 gits par heure...

    exemple : ENI{1987_Ya_qqUn_Au_Bout_dU_fIl}

## Solution
Le flag du chal :
  - ENI{2003_Hoverbo@rd}

Les autres flags de la série
  - ENI{2001_Flux_C@p@citor}      (__86 gits par heure__)
  - ENI{2002_Hill_V@lley_1955}    (__87 gits par heure__)

### FLAG 3 (88 gits...)
Plus compliqué, il se trouve dans un commit qui a été écrasé et "perdu" après un reset.
Il faut checker les __losts and found__ pour trouver le commit perdu et afficher son contenu
```bash
git log --oneline --all  ## On voit que le commit f78c9f6 semble prometteur
git checkout 4861def     ## Rien n'est visible dans ce commit... le précédant ?
git checkout 535ca33     ## Rien non plus... Cherchons la "corbeille" de GIT
git fsck --lost-found    ##  dangling commit 6b048b526d5eb3c8ec3...1f6053607ca
                         ## Prometteur tout çà...
git show 6b048b526d5eb3c8ec3dd652e83d21f6053607ca`
                         ## TADA > +FLAG3=ENI{2003_Hoverbo@rd}
```


## Hints
  - Bien lire les messages de commit (pour voir que l'interne a fait de la merde en mettant une clé api et que son commit aussi a été viré)
  - Peut-être qu'un commit a été supprimé... (Y'a une corbeille dans GIT ?)
