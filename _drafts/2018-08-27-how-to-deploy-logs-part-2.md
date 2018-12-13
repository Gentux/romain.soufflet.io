---
categories: work devops sre deployment logs
custom_css: posts.css
date: 2018-08-27 09:36:32
img: https://s3.eu-west-2.amazonaws.com/gentux/Images/store_and_consult_logs.jpg
layout: post
excerpt_separator: <!--more-->
language: fr
public: yes
title: Le déploiement : Les logs (2ème partie, architecture)
---

Intro bien gaulé

<!--more-->

## La volumétrie et le stockage

J'aime beaucoup l'analogie du capitaine de navire et de son journal de bord.
Mais si nous avons un capitainer qui aime maintenir un journal très détaillés,
de combien de carnet aura-t-il besoin ?

Et si le navire coûle, en toute logique, le journal est engloutie avec le reste
du navire. C'est embêtant car nous ne pourrons pas découvrire ce qui s'est
passé, et d'autre batîments pourrait donc subir les mêmes évennement et sombrer
à leur tour. Comment allons-nous garantir de pouvoir récuperer le journal ?

Nous avons de la chance, nos applications ne tournent pas au milieu de l'océan
mais dans des salles serveurs. Nous allons donc pouvoir nous pencher un peu sur
l'architectures de nos journaux afin de garantir le stoquage de ces dernier.

### Volumétrie

La volumétrie nous permet de prédire la quantité de données qui sera généré par
notre application. Cette étape est très importante pour prévoir des stratégie de
stoquage efficace par la suite.

Notre journal est composé d'entrés. Une entrée est une date a laquelle on
associe une valeur. Une date, sous forme d'un
[timestamp](https://fr.wikipedia.org/wiki/Heure_Unix) nous prendra 8 octets. La
valeur elle, dépendra de notre entrèe et prendra *X* octet.

Pour commencer, on prend un cas simple, le pourcentage d'utilissation CPU. La
valeur sera un entier et dans la pluparts des système, un entier prend 4 octets.
Nous avons ainsi un journal ou chaque entrée prend 12 octet.

Maintenant, un logs textuel de type « L'utilisateur 4034735 à donnée les droits
à l'utilisateur 48599828 sur le fichier 02384579 ». Ce message prend 142 octets
et si on compte la date qui lui est associée, nous avons un message de 150
octets.

Donc, si notre application donne une valeur toutes les minutes pendant un an:
365 * 24 * 60 * 150 octets nous donne environ 75Mo.

Ce calcul ne changera pas, il sera le même pour tout les journaux que votre
application va créer : On multiplie simplement la fréquence d'apparition des
entrée par la durée de stoquage et la taille d'une entrée.

On obtient de cette manière des valeurs approximative de ce dont on aura besoin
pour stocker nos journaux.

### Stoquage

Si on multiplie nos journaux par le nombre d'application puis par le nombre
d'utilisateurs, on obtient rapidement des valeurs assez grandes. Le stoquage des
journaux est un sujet récurrent quand on parle d'application en production.

Depuis le début de ma carrière, je n'ai jamais vu une seule entreprise
s'affranchir définitement de l'erreur _No space left on device_. Et la plupart
du temps il s'agit de journaux mal gérés qui remplissent le disque dur des
machines.

Comment stoquer les journaux de notre applications ? La première solution, la
plus courante d'ailleurs, c'est de les mettre dans des fichiers texte sur la
machine en elle même.

Cependant, si chaque machine stoque ces propres journaux, on se retrouve dans la
situation ou les journaux disparraissent en même temps que le navire fait
nauffrage. Encore une fois, nous avons la chance de ne pas être en pleine mer,
nous pouvons envoyer ces journaux au fur et à mesure dans un services de
stockage.

Cela fonctionne de la même manière qu'une base de données. Soit nous lui
envoyons chaque entrée une par une, soit on lui fait des paquet de X entrées.
C'est ici qu'on trouve cette notion de *flux* qui est utilisé dans la
définition de [*twelve-factor app*](https://12factor.net/fr/).

### Supression

Maintenant, essayez d'imaginer que chaque services qui composent votre
production centralise les journaux au même endroits. Il apparaît logiquement
que cette machine vient d'acquèrir une très forte valeurs en receuillant tout
les journaux. Nous allons donc y accorder un peu d'attention.

De la même manière qu'un journal peut grossir et saturer une machine, si on met
plusieurs journaux sur une machine, elle va saturer au bout d'un certain temps.
Nous allons donc devoir mettre en place une *rotation* des journaux.

La *rotation* est un script qui s'execute régulièrement pour effacer, renommer
ou compresser les anciens journaux. Cela nous permet de garantir qu'il y aura
toujours de la place sur la machine car nous faisons régulièrement de la place.

Mais nous ne pouvons pas juste supprimer des informations qui pourrait nous être
utile. Nous avons donc besoin de définir une *stratégie de rétention des
journaux*

 * Combien temps de journal doit-on garder
 * À partir de quel taille un journal devient-il trop gros ?
 * Comment organise-t-on les sauvegarde pour s'assurer de ne rien perdre
   d'important ?

Parce que la suppression peut être dangereuse, dans certains cas, les
informations contenue dans nos journaux peuvent être couvert légalement et avoir
des contraintes tel que « Nous garderons la liste des accés au bâtiments 34c
pendant 5 ans ».

Il est donc important de s'assurer que les journaux archivé sont bien stoqués
dans des entrepots dediés.

## Conclusion partie 2


# Partie 3 : La consultation et l'exploitation

## L'enrichissement des logs

Les tags, pour savoir d'ou qu'ils viennent
Prometheus

## La consultation

- Graffana, les jolies courbes
- Mais aussi des systèmes de detection d'anomalies

## Le monitoring

- Voir les courbes aide à la décision

## Conclusion partie 3
