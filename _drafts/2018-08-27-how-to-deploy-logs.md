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

## Intro

Quand une application tourne en production, elle produit des **logs**. On les
appelles **journaux** en français et sont en quelques sortes l'équivalent du
journal de bord du capitaine d'un navire.

À la manière d'un long périple en mer, de nombreux éléments peuvent pertuber
l'execution du programme, et savoir ce qu'il se passe nous aide à surmonter les
différentes difficulté de notre voyage.

En lisant ces journaux on comprend ce qui s'est passé durant le voyage. Nous
pouvons alors comprendre les différentes décision du capitaine et son équipage.
J'aime beaucoup cette analogie, et nous la réutiliserons durant cette article.

Revenons à notre production, et réflechissons un peu à nos journaux de bords.
Nous avons plusieurs problèmatique:

  - Quels type d'évennement devont nous enregistrer ?
  - Quels espace de stoquage devons nous prévoir ?
  - Comment consulter efficacement ce que nous écrivons ?

## Les types de logs

- Que dit 12factoreApps ? Qu'est-ce qu'un log ?

Vous avez des logs user : Qui fait quoi, et quand
Vous avez des logs system : Les erreurs https 40X, erreur 500 bugs,
vous avez des logs technique : Les temps de réponses de votre applications, consommation CPU

Il faut bien comprendre que tout ces logs sont utile.
Savoir à qui ils s'adresse et si ils sont néscessaire

Un stream de logs

## La volumétrie et le stockage

Un log, c'est une date, et une valeur. Pour commencer, on prend un cas simple, le pourcentage d'utilissation CPU

Une date = X octet
Une valeur = Y Octet, donc un logs c'est Z octet.

On veux une valeur par minute pendant un an => 365 * 24 * 60 * Z octet.

Maintenant, un logs textuel de type "L'utilisateur 4034735 à donnée les droits à l'utilisateur 48599828 sur le fichier 02384579"
Ce message fait P octet

Si on multiplie le nombre d'utilisateur, donc le nombre de logs

## La consultation

Voir les courbes aide à la décision

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
