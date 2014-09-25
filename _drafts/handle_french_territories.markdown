---
layout: post
title: "About french territories in free softwares"
date: 2014-09-20 13:33:42
categories: python OSM OpenData
---

Salut les dev !

À la demande expresse de notre cher Bibi, et aussi parce que ça semble utile, je fait un rapide point de la gestion des
territoires et la cartographie.

Ces territoires, on s'en est beaucoup servis dans le cadre de Comarquage, et les logiciels et données impliquées sont
repris et complétés par l'équipe Etalab (Schoultz et Manou pour ceux qui seraient paumé)


## Les différents jeux de données

Précisions, pour être sûr qu'on parle de la même choses, je vois 3 notions à détacher :

* Les tiles
* La hiérarchie des territoires
* Les adresses géocodées

Les tiles sont généré par le serveur de cartographie, ce sont les images qui servent de fond de carte et par dessus
lesquels on peux dessiner zones ou point d'intérêt.

La hiérarchie des territoires, c'est la partie géré par les logiciels "Territoria2" et "Territoria2-Web" dans
comarquage. Je reviens dessus dans la prochaine section de ce mail.

Les adresses géocodées, c'est le fait de passé d'une adresse de type "44/46 rue de l'ouest, 75014" à un triplet de
coordonées (latitude, longitude et précision)


Je passe la description des Tile, car je dois m'occuper de mettre ce services à jour prochainement et j'écrirai une
documentation sur le sujet.


## La hiérarchie des territoires

Actuellement, nous gérons les territoires de France grâce aux données de l'INSEE (Insitut national de la statistique et
des études économiques) qui s'occupent à notre place de recueillir moulte sources de données et d'agrégé tout ça dans
des fichiers textes plus où moins facile à traiter.

Ces fichiers sont données à Wenodata, un services de traitement de jeux de données que Manou a écrit.
Une fois tout les traitements effectués dans Wenodata, on importe les territoires via Territoria2 dans une base mongoDB.

Territoria2 est une librairie de gestion des territoires français, pour avoir l'API REST, il faut installer l'outil
Territoria2-Web.


Le but de cette base et de son API, c'est de pouvoir rattaché les territoires les uns aux autres, ainsi, dans le cas de
Comarquage, quand nous avons un point d'intérêt compétent pour le département de l'Yonne, nous somme capable de marqué
le point comme compétent pour Auxerre car il est compétent pour l'un des ancêtres de la ville d'Auxerre.


De même que pour les autres outils Comarquage, je doit écrire la documentation de ces projets (tout un programmes), je
vous tiendrai au courant.

En attendant, si vous avez besoin d'information sur Territoria, envoyez moi un mail ;)


## Les adresses Géocodées

C'est la vilaine bête concernant la cartographie, le géocodage. Il y a actuellement plusieurs solutions pour cela.

La première solution, c'est le service que fournit l'IGN (Institut National de l'Information Géographique et
Forestière… c'est un stagiaire qui a fait l'accronyme, il a oublié des lettres :/). Ce services est tout pourris et mal
foutu, et je crois que les données ne sont pas libres et que le services est payant (à vérifier).

Bref, dans comarquage on bidouille en générant une clé "développeur" et on leur envoie "localhost" comme nom de site…
ça suffit pour que l'IGN nous laisse nous servir du service.


Le seul webservices concurents suffisement complet est celui de laposte, complétement payant et complétement pas libre.

Avec ce constat, Christian Quest (vice président OpenStreetMap-Fr) et l'équipe Etalab en ont eu marre et on commencé le
projet BANO (Base d'Adresse National Ouverte).

BANO extrait donc les adresses géocodé d'OSM, c'est complétement libre, on peux prendre les données et en faire ce qu'on
veux, cependant, le projet est récent et le jeux d'adresses n'est pas complet. On a environ 17Million d'adresse dans
BANO sur environ 40Million d'adresse estimé en France.


Nous avons aussi les mecs de Photon.net qui ont rejoint Etalab sur cette initiative. Pour info, Photon, selon moi, c'est
pour l'instant la meilleur solution. C'est jolie, y a une API, bref, ça existe, servons-en nous.

J'ai pas plus creusé que ça, si en fait c'est tout pourri, vous pouvez me le dire.


## Conclusion

Voilà un "rapide" tour d'horizon de mes propres connaissance sur le milieu cartographique/territorial français.

Vu la quantité d'info à couvrir, j'ai sans doute oublié des choses. Pour corriger ça, j'ai un gros travail de
documentation devant moi, je le sais bien, mais si vous avez des questions je répondrai le plus précisement possible.
