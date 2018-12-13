---
categories: work devops sre deployment logs
custom_css: posts.css
date: 2018-08-27 09:36:32
img: https://s3.eu-west-2.amazonaws.com/gentux/Images/store_and_consult_logs.jpg
layout: post
excerpt_separator: <!--more-->
language: fr
public: no
title: Le déploiement : Les logs (1er partie, les bases)
---

Quand une application tourne en production, elle produit des **logs**. On les
appelles **journaux** en français et sont en quelques sortes l'équivalent du
journal de bord du capitaine d'un navire.

À la manière d'un long périple en mer, de nombreux évennements peuvent pertuber
l'execution du programme. En lisant ces journaux on comprend ce qui s'est passé.
Nous pouvons alors identifier les difficultés passées et prendre les décisions
pour les éviter à l'avenir.

Je vais essayer avec cette article de définir et présenter les journaux
applicatifs: Quels sont les types de journaux et à quoi servent-ils ?

<!--more-->

J'écrirai par la suite une deuxième partie pour montrer une vue d'ensemble de la
gestion des journaux et finalement une troisième partie pour parler de
l'implémentation.

## Différents types de logs

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
donner une bonnes vue d'ensemble.

### Les journaux utilisateurs

Tout d'abord nous avons les journaux utilisateurs. Ils nous disents *qui*
effectue *quelle* action et *quand*. Si on prend l'exemple d'un site de commerce
en ligne, nous pourrions trouver une entrée qui ressemble à « 15h45:
L'utilisateur JM240 a validé la commande R4039 ».

Ces journaux sont très simple à comprendre par n'importe quel humain. Ils
correspondent à des actions que les utilisateurs peuvent effectuer. Cependant,
derrière cette simplicité à lire et comprendre se cache une grande difficulté de
conception.

Derrière chaque action utilisateur se cache des dizaines d'actions automatisées
par nos différents programmes. Il est difficile dans ce contexte de savoir ce
qui est important d'écrire où non. Demander à un développeur d'ajouter
l'écriture des journeaux dans un programme existant, c'est un peu comme demander
à un pilote d'avion de voler : très bien, mais on va où ?

En ce qui concerne les journaux utilisateurs, le besoin doit être formulé
fonctionnelement pour que les développeur sachent quoi écrire, et quand.

### Les journaux fonctionnels

Nous avons ensuite des journaux fonctionnels avec des informations plus
techniques sur le fonctionnement de notre application.

Un exemple connu d'erreur fonctionnel est l'erreur « 404 Not found ». Avec le
protocole HTTP (qui nous sert à consulter les sites internet), les erreurs entre
400 et 499 sont des erreurs liées à une mauvaise requête de l'utilisateurs. Les
journaux fonctionnels font aussi apparaître les erreur supérieures à 500, ce
sont les erreurs de programmation, les comportement innatendus.

Le grand avantage de ces journaux est qu'ils sont automatiquement écris par les
logiciels que l'on utilise. En effet, lorsqu'on déploit une solution, la partie
écrite par notre équipe d'ingénieure n'est que la partie émergé de l'iceberg.
Beaucoup de logiciels collaborent pour nous fournir notre solution compléte.

De ce fait, ces journaux sont facile à comprendre pour n'importe quel ingénieur,
car ils ont le même format dans tout les projets.

Sur les applications écrites par nos équipes, c'est un réflexe qu'il faut
acquérir. Écrire les informations qui pourrait être important aux personnes qui
exploitent l'applications et pour cela, il faut que l'équipe de développement
collabore avec l'équipe d'exploitant. On revient ici sur les notions DevOps que
je détails dans d'autres articles [ici]() et [là]()

### Les journaux techniques

Et finalement, nous avons les logs techniques, ceux-ci sortent du cadre
de notre application et concernent plutôt l'environnement d'execution, on pourra
y mesurer les temps de réponses de l'application, la consommation de ressource
physique tel que la quantité de mémoire ou l'utilisation des processeurs.

Le plus souvent pour ceux là, on parle de sondes entretenu et déployer par les
équipes d'exploitation. L'erreur la plus fréquente que je trouve chez mes
clients et justement de ne pas inclure les développeurs dans cette discussions.

Par exemple, j'ai récemment vu un comportement sur les machines de productions
avec une consomation mémoire en constante augmentation. Aucune alerte n'est
levée jusqu'à ce que la machine soit au bord de la panne, l'équipe
d'exploitation automatise alors une « solution » : On redémarre l'application
lorsqu'on atteint 80%. C'est une très mauvaise solution, le bon réflexe ici
aurait été d'inviter les développeurs à corriger la fuite mémoire.


## L'usage des journaux

Chaque évenement nous donnes donc une nouvelle entrée dans nos journaux
d'évenements, chaque entrée est datée et contient une description qui sera plus
où moins précise.

Si l'on reprend notre analogie du capitaine et de son journal de bord, il
apparait que la qualité, la quantité et la pertinence des logs dépendent
directement du capitaine qui les écrit. Bien souvent, les équipes ne sont pas
assez sensibilisé aux enjeux que consituent nos journaux d'évenements.

Pourtant, les journaux sont une vrai mine d'or, je vais donner quelques exemple.

Premièrement, on pourrait demander combien d'utilisateur on partagé un fichier
dans les deux derniére heure. C'est un usage statistique des logs. Comprendre le
comportement des utilisateurs peut être très utile pour décider des nouvelles
fonctionnalités où pour simplifier le logiciel en enlevant des fonctionnalités
peu utilisées.

Tant qu'on est sur le comportement utilisateur, il est aussi possible de baser
la facturation sur les journaux d'évenement. En regardant nos journaux, on est
effectivement capable de savoir ce qu'on fait les utilisateurs et ainsi en
déduire leur consommation de notre produit.

Dans un deuxième temps, savoir quel utilisateurs effectue quel action est l'une
des bases de la sécurité en informatique.

Et toujours sur l'aspect sécurité, nos journeaux fonctionnels sont souvent les
témoins d'attaque aléatoires. Ces attaques sont extrêmement fréquente sur
internet.

## Conclusion

Bien entendu, je ne peux pas être exhaustif sur l'usage que l'on fait de ces
journaux, cela dépend beaucoup du produit et de l'entreprise. J'ai tenté dans
cette article de donner une vision d'ensemble de ce que sont les logs et à quoi
ils servent.

Dans le prochains articles, je vais rentrer dans des considérations un peu plus
technique sur la gestions des journaux, leur stockage.

Dans une troisièmes partie, nous parlerons des usages plus avancé tel que le
monitoring où la consultation des logs en temps réel.
