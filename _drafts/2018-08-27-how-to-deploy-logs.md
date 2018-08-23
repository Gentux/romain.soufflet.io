---
categories: work devops sre deployment logs
custom_css: posts.css
date: 2018-08-27 09:36:32
img: https://s3.eu-west-2.amazonaws.com/gentux/Images/store_and_consult_logs.jpg
layout: post
excerpt_separator: <!--more-->
language: fr
public: yes
title: Le déploiement : Les logs (1er partie, les bases)
---

Quand une application tourne en production, elle produit des **logs**. On les
appelles **journaux** en français et sont en quelques sortes l'équivalent du
journal de bord du capitaine d'un navire.

À la manière d'un long périple en mer, de nombreux évennements peuvent pertuber
l'execution du programme, et savoir ce qu'il se passe nous aide à surmonter les
différentes difficulté de notre voyage.

En lisant ces journaux on comprend ce qui s'est passé durant le voyage. Nous
pouvons alors identifier les difficultés passées et prendre les décisions pour
les éviter à l'avenir.

La qualité du journal du bord, sa précision et sa complétude dépendent du
capitaine. Tout comme nos journaux applicatifs dépendent de nos développeurs.

Je vais essayer avec cette article d'éclairer les notions de journaux
applicatifs. Pour cela, je vais définir ce que sont ces journaux exactement,
comment les stoquer, et finalement comment les consulter.

J'écrirai par la suite une deuxième partie pour détailler l'implémentation de
ces logs avec des cas plus concrets.

## Les types de logs

En matière de développement, il existe une référence incontournable : [The
twelve-factors app](https://12factor.net/fr/). Ce référentiel de bonne pratiques
nous donnes une très bonne définitions des journaux :

  Les logs sont des flux (en) d’agrégats d’évènements, ordonnés dans le temps,
  collectés à travers les flux de sortie de tous les processus et services
  externes qui tournent. Les logs, dans leur forme brute, sont au format texte
  avec un événement par ligne (bien que les traces d’exécutions puissent
  s’étaler sur plusieurs lignes). Les logs n’ont pas de début ou de fin fixe,
  mais se remplissent en continu tant que l’application est en marche.

Même si cette définition est très juste, elle n'est pas très accessibles pour
des profiles non technique. Je vais donc essayer une approche basé sur
l'exemple, je vais décrire les trois principaux types de journaux que l'on
trouve dans la pluparts des applications, et ces différents exemple devrait vous
donner une bonnes images de ce que sont les journaux.

Tout d'abord, parmis les journaux que va écrire notre application, nous avons
les journaux utilisateurs. Ils nous disents *qui* effectue *quelle* action et
*quand*.

Nous avons ensuite des journaux fonctionnels avec des informations plus
techniques sur le fonctionnement de notre application. Un exemple connu d'erreur
fonctionnel est l'erreur « 404 Not found ». Avec le protocole HTTP (qui nous
sert à consulter les sites internet), les erreurs entre 400 et 499 sont des
erreurs liées à une mauvaise requête de l'utilisateurs (404 signifiant que l'URL
est incorect). Les journaux fonctionnels font aussi apparaître les erreur
supérieures à 500, ce sont les erreurs de programmation, les comportement
innatendus.

Et finalement, nous pouvons avoir les logs techniques, ceux-ci sortent du cadre
de notre application et concernent plutôt l'environnement d'execution, on pourra
y mesurer les temps de réponses de l'application, la consommation de ressource
physique tel que la quantité de mémoire ou l'utilisation du processeur.

Chaque évenement nous donnes donc une nouvelle entrée dans notre journal, chaque
élément est daté et contient une description qui sera plus où moins longue.

Si l'on reprend notre analogie du capitaine et de son journal de bord, nous
pouvons aussi comprendre que la qualité, la quantité et la pertinence des logs
dépendent directement du capitaine qui les écrit. Nous reparlerons de l'écriture
de nos journaux dans la deuxième partie qui parlera de l'implémentation.

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
du temps il s'agit de journaux mal géré qui remplisse le disque dur de la
machine.

Une machine a toujours besoin d'écrire des informations temporaire sur le
disque. Même si votre application ne le fait pas, le système d'exploitation lui
en aura besoin. Un disque dur remplit à 100% resulte donc forcément en erreur
sur votre application.

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

Maintenant, essayez d'imaginer que chaque services qui composent votre
production centralise les journaux au même endroits. Il apparaît logiquement que
cette machine vient d'acquèrir une très forte valeurs. Nous allons donc y
accorder un peu d'attention.

De la même manière qu'un journal peut grossir et saturer une machine, si on met
plusieurs journaux sur une machine, elle peut se saturer. Je vais donc expliquer
la notions de *rotation* des journaux.

La *rotation* c'est un script qui va s'executer régulièrement pour effacer les
anciens journaux. Cela nous permet de garantir qu'il y aura toujours de la place
sur la machine car nous faisons régulièrement de la place.

## La consultation

Tout ça c'est bien gentil, mais si on supprime les logs, à quoi cela servait-il
de les récolté en premier lieu ?

- Backup les anciens logs
- Pouvoir les remettre pour consultation

- Voir les courbes aide à la décision
- Définir les alertes

## Conclusion

Ready for part 2 ?



# Partie 2 : L'implémentation

## Intro

Dans le précédent article, on parle des logs de maniére général afin de poser les bases.

Maintenant on va architecturer notre collecte de logs pour l'utiliser dasn des cas concret. Je vais m'appuyer sur des technologies existentes

## Les applications

- Votre application doit être stateless
- La volumétrie d'une application... multiplié par le nombre d'instance
- Quand vous en faites tourner 10 000... ça devient plus compliqué
- Individuellement, qu'est-ce qui se passe ? Le pouvoir des multiplications

Les tags ! viva prometheus

## Centralisation des logs : Prometheus

L'architecture de vos logs va grandemetn impacté leurs performances

Chaque application exporte les logs, mais où ?
Gestion des logs as stream => Mais où les stocker ?

Volumétrie des logs, Replication, Suppression
Comment on implémente tout ça ?

Ne pas tout mettre au même endroit

## Visualiser les logs : Grafana

Visualisation des logs ? comment on fait, pourquoi ?
Les implémentation

Grafana, l'un des plus connus. Mais la performance est importante

Partie fun ! Mais complexe en réalité quand y a beaucoup d'instances dans la production

## Le monitoring

Pas vraiment de régle, et c'est bien là tout le problème.
L'application peut casser de bien des manières différentes

Surveiller les metrics saine.
Établir des seuilles d'alerte cohérents avec votre produit
Éviter les alertes innutile
