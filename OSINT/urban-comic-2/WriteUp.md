# Challenge
Urban Comic (2/2)

## Enonce
Un type de véhicule passe quotidiennement devant ce bâtiment. En juillet 2020, celui portant le numéro 1035 a été photographié à cet endroit. Quelle est la marque, le modèle et la date de mise en service ?

exemple : ENI{marque_modele_24-12-2025}

## Solution
Si nous nous plaçons à côté de la fresque en mode Street View sur Google Maps, nous pouvons voir qu'il y a une ligne de tramway juste devant. En regardant les images plus anciennes, nous voyons passer une rame en juillet 2020. Si nous avançons dans la rue, nous pouvons voir le numéro de la rame : 1035.

![image](src/wu-image1.png)
![image](src/wu-image2.png)

Reste à identifier le modèle. Si nous cherchons les termes "tramway strasbourg" sur un moteur de recherche, nous trouvons dans les résultats une page Wikipedia sur le sujet (https://fr.wikipedia.org/wiki/Tramway_de_Strasbourg). Nous apprenons que la ville exploite des rames de trois modèles différents : Bombardier Eurotram, Alstom Citadis 403 et Alstom Citadis 405. Reprenons la photo de la rame pour en identifier des éléments distinctifs :
- la partie avant est bombée
- une partie verte est présente sous le pare-brise
- les feux avant sont placés au niveau de la partie verte et de forme ovale
- un logo rond est présent entre les deux feux avant
- la rame est de couleur grise avec une partie blanche en bas
- la vitre la latérale du poste de conduite est triangulaire

![image](src/wu-image3.png)

Nous pouvons commencer par la page Wikipedia, qui indique les trois modèles utilisés. La page comporte déjà une photo du Citadis 403, qui ne ressemble pas du tout à notre modèle (feux, vitre latérale de la cabine, structure latérale).

![image](src/wu-image4.png)

Une recherche sur un moteur de recherche nous permet de trouver cet article (https://www.railpassion.fr/transports-urbains/strasbourg-le-citadis-405-acheve-le-renouvellement-du-parc-tramway/) sur la livraison de Citadis 405 à Strasbourg. Là encore, la forme ne correspond pas du tout.

![image](src/wu-image5.png)

Si nous regardons la page du Bombardier (https://fr.wikipedia.org/wiki/Bombardier_Flexity_Outlook), nous trouvons en bas deux photos du modèle circulant à Strasbourg. Cette fois, nous retrouvons la partie verte sous le pare brise, les feux ovales, le logo rond au milieu, ...

![image](src/wu-image6.png)

Nous devons trouver la date de mise en service. Tentons les mots clés suivants dans un moteur de recherche : "tramway de strasbourg rame 1035". Selon le moteur de recherche, nous trouvons différents résultats intéressants. Le premier, une vidéo de la rame 1035 de Strasbourg, qui confirme le modèle (https://www.youtube.com/watch?v=Bz8AJ_InL3o). La description de la vidéo comporte un lien vers une page (https://tc-infos.fr/vehicule/496) qui nous donnera une partie de la date de mise en circulation : février 1999. Il est également précisé que cette rame comporte la livrée CTS Eurotram (Compagnie des Transports Strasbourgeois).

![image](src/wu-image7.png)

Le site strasbourg-tramway.fr, que l'on trouve avec la même recherche, nous donne cette fois la date complète (l'adresse https://www.strasbourg-tramway.fr/compo%20parc%20tram%202014.html) : la rame 1035 est un Bombardier Eurotram mis en service le 05/02/1999.

![image](src/wu-image8.png)

Le flag est donc ENI{bombardier_eurotram_05-02-1999}

## Hints
  - "Un service très connu permet de visualiser les villes (rues) comme si on y était."
  - "Vous avez trouvé la photo du véhicule ? Analysez les éléments-clés de sa structure extérieure pour identifier le modèle."
