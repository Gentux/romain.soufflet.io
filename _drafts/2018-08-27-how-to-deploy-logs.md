---
categories: work devops sre deployment
custom_css: posts.css
date: 2018-08-27 09:36:32
img: https://s3.eu-west-2.amazonaws.com/gentux/Images/deploy_success.jpg
layout: post
excerpt_separator: <!--more-->
language: fr
public: yes
title: Le déploiement : Les logs (étude de cas Kubernetes)
---

## Intro

- Que dit 12factoreApps ? Qu'est-ce qu'un log ?
- Quel types de logs ?
- Pourquoi c'est important ? => Monitoring

## L'application

- Votre application doit être stateless
- Quand vous en faites tourner 10 000... ça devient plus compliqué
- Individuellement, qu'est-ce qui se passe ?
- Centraliser les logs

## Gestion des logs avec Kubernetes

L'architecture de vos logs va grandemetn impacté leurs performances

Chaque application exporte les logs, mais où ?
Gestion des logs as stream => Mais où les stocker ?

Volumétrie des logs
Replication
Suppression

Comment on implémente tout ça ?

## Visualiser les logs

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

## J'avais promit de faire cours T_T
