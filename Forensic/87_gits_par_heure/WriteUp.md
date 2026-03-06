# Challenge
__87_gits par heure__
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
  - ENI{2002_Hill_V@lley_1955}

Les autres flags de la série
  - ENI{2001_Flux_C@p@citor}    (__86 gits par heure__)
  - ENI{2003_Hoverbo@rd}        (__88 gits par heure__)

### FLAG 2 (87 gits...)
Le flag 2 a été déplacé dans un .env dès le 2nd commit en base64
```bash
git log --oneline --all  ## Le 2ème commit améliore-t-il vraiment la sécurité ?
git checkout a2d23a5     ## Checkout du commit interessant
cat docker-compose-yml   ## Flag changé, mais on voit un .env aussi
cat .env                 ## FLAG2=RU5JezIwMDJfSGlsbF9WQGxsZXlfMTk1NX0=
                         ## Decode > ENI{2002_Hill_V@lley_1955}
                         ## BRAVO !!!
```

## Hints
1) Pas besoin de hints C'est du basic de `checkout` et `ls` et `cat`
