---
categories: work devops sre architecture
custom_css: posts.css
date: 2018-06-20 13:04:45
img: https://upload.wikimedia.org/wikipedia/commons/3/32/Lego_Color_Bricks.jpg
layout: post
excerpt_separator: <!--more-->
language: fr
public: yes
title: "C'est beau DevOps et SRE, mais comment je met ça chez moi ?"
---

Dans les deux précèdant articles, je parlais de la production au sens large et
j'ai ensuite parlé de la culture DevOps et du rôles SRE. Mais j'aimerai
approfondir un peu plus cette ensemble et parler plus spécifiquement des
déploiements. J'aimerais expliquer dans les grandes lignes comment je gére les
déploiements chez mes clients, montrer les bénéfices de cette approches et
parler des méthodes et outils que j'utilise pour gérer la transitions vers ce
nouveau modèle de déploiements.

<!--more-->

## L'architecture immutables

* VM ou Container ?
* Les golden images
* Les unités sont indépendante et peuvent vivre seules

## L'architecture globale

* Chaque rôle dans sa VM ou conteneur
* Limiter le réseau
* De la résolution de nom de domaines
* Collection de logs

## BlueGreen

* On passe au déploiements !
* Concept du blue green
* Concept d'environnements

## Bilan de santés

* Les healtchecks
