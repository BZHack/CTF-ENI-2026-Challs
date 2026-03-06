# bashit

## Énoncé : 

    A partir de ce script (ba_shit.sh) retrouvé le flag !
    Bonne chance !
    


```2fc3a820 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c2a0c3a9 2fc3a820 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c3a9 2fc3a8c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c2a0c3a9 2fc3a8c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c3a9 2fc3a820 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 c3a92fc3 a820c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c3a92f c3a8c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c2a020c2 a0c3a92f c3a820c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c3a92fc3 a8c2a020 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c3a9 2fc3a820 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c3a9 2fc3a820 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c3a92f c3a820c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c2a0c3a9 2fc3a8c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c2a020c2 a0c3a92f c3a820c2 a020c2a0 20c2a020 c2a020c2 a0c3a92f c3a820c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c3a9 2fc3a8c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c3a92f```
    
    Auteur : Penthium2 (BZHack)

## Analyse du code :

Durant une première lecture on voit que le script prend un argument en entré qui est un fichier. Surement le fichier contenant le flag.

### exécution du script pour voir ce qui ce passe : 

On va créer un fichier contenant : 

    FLAG{test}

on exécute le script et on obtient : 

```2fc3a820 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c2a0c3a9 2fc3a820 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c3a9 2fc3a8c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c2a0c3a9 2fc3a8c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c3a9 2fc3a820 c2a020c2 a020c2a0 20c2a020 c2a020c2 a020c2a0 c3a92fc3 a8c2a020 c2a020c2 a020c2a0 20c2a020 c3a92fc3 a820c2a0 20c3a92f c3a820c2 a020c2a0 20c2a020 c2a020c2 a0c3a92f c3a8c2a0 20c2a020 c2a020c2 a020c2a0 20c3a92f c3a8c2a0 20c2a020 c2a020c2 a020c2a0 20c2a020 c2a020c3 a92f```

Intéressant on remarque des choses en commun avec ce qu'il y a dans l'énoncé et la sortie de notre test.


### continuons l'analyse :
dans le script il y a la variable "a" et "A" qui ressemble a une déclaration de variable tableu en bash :

```var=(un deux trois)```

les deux eval  vont transformé les variable "a" et "A" en variable tableau.

```
eval a=$a
eval A=$A
```

cette boucle for va joindre les valeurs des  variable "A" et "a" suivant la position du tablea : et inscrire cela dans la variable muh


```
for i in {0..1489} ; do
        muh="$muh ${A[$i]} ${a[$i]}"
done
```
On se retourve donc avec une très grande variable ressemblant énormémant a du binaire.

```
muh=$(echo $muh | perl -lape '$_=pack"(B8)*",@F')
```
transforme le binaire en ASCII :

Le contenu de muh est donc maintenant un truc de se style : : 

```
declare -A paslinux;paslinux[a]="è é";paslinux[b]="è é";paslinux[c]="è  é";paslinux[d]="è  é";paslinux[e]="è   é";paslinux[f]="è   é";paslinux[g]="è    é";paslinux[h]="è    é";paslinux[i]="è     é";paslinux[j]="è     é";paslinux[k]="è      é";paslinux[l]="è      é";paslinux[m]="è       é";paslinux[n]="è       é";paslinux[o]="è        é";paslinux[p]="è        é";paslinux[q]="è         é";paslinux[r]="è         é";paslinux[s]="è          é";paslinux[t]="è          é";paslinux[u]="è           é";paslinux[v]="è           é";paslinux[w]="è            é";paslinux[x]="è            é";paslinux[y]="è             é";paslinux[z]="è             é";paslinux[{]="è              é";"
```

Donc une suite de déclaration de variable tableau "paslinux" avec comme valeur de colone du tableau : "a" "b" "c" etc... et une valeur Obscure du type "é    è"

Cela ressemble grandement a un dictionaire.

et si on ajoutais un truc de débug a cette ligne : 

```
echo $muh
```
avec :
```
echo $muh | head -c 125 | od -c
```
cela va nous montré les vrais valeurs des 125 carractères :
```
0000000   d   e   c   l   a   r   e       -   A       p   a   s   l   i
0000020   n   u   x   ;   p   a   s   l   i   n   u   x   [   a   ]   =
0000040   " 303 250     303 251   "   ;   p   a   s   l   i   n   u   x
0000060   [   b   ]   =   " 303 250 302 240 303 251   "   ;   p   a   s
0000100   l   i   n   u   x   [   c   ]   =   " 303 250     302 240 303
0000120 251   "   ;   p   a   s   l   i   n   u   x   [   d   ]   =   "
0000140 303 250 302 240     303 251   "   ;   p   a   s   l   i   n   u
0000160   x   [   e   ]   =   " 303 250     302 240     303
```

Les "303 250" "303 251"  "302 240" sont des caractères unicode resemblant a deux goute d'eau au résultat d'un espace : " "

Voila comment ce dico peut semble est fait que d'espace mais en faite nom.

la suite est une suite de manipulation du 'flag venant du fichier pour l'encodé avec ce dico et ofusqué le résultat. 

Mais on a le principe le dico !!

## Reverse du script : 
