# Challenge
__86_gits par heure__
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
  - ENI{2001_Flux_C@p@citor}

Les autres flags de la série
  - ENI{2002_Hill_V@lley_1955}    (__87 gits par heure__)
  - ENI{2003_Hoverbo@rd}          (__88 gits par heure__)

### Analyse initiale du repo
Voyons voir ce que nous reserver cette app une fois dézippée...
```bash
ls                      ## Le fichier docker-compose.yml semble interessant
cat docker-compose.yml  ## > FLAG1=ENI{removed_because_not_secured}  - AHAH
                        ## > mais env_file: .env >> allons voir
cat .env                ## FLAG2=UmVtb3ZlZCBmb3Igc2VjdXJpdHkgY29uY2VybnM=
                        ## JUICY mais ==> "Removed for security concerns"
                        ## DAMNED !!!
                        ## On ne trouvera rien dans ce commit...
```

### FLAG 1 (86 gits...)
Retournons à la création de l'app (on voyage dans le temps ou bien ?)
```bash
git log --oneline
git checkout f08d140      ## Premier commit
cat docker-compose-yml    ## Peut-être que là ca va le faire ??? OUIIII !!!
```

## Hints
1) Pas besoin de hints C'est du basic de `checkout` et `ls` et `cat`
