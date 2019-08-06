---
categories: production deployments
custom_css: posts.css
date: 2019-06-17 12:32:10
img: "https://s3.eu-west-2.amazonaws.com/gentux/Images/pipelines.jpeg"
layout: post
excerpt_separator: <!--more-->
language: fr
public: yes
title: "Les mises en production à l'air du DevOps"
---

Le mouvement *DevOps* nous a promis des mise en production simple et sans
douleur. Mais derriére cette promesses se cache un tout autre diable : La
qualité.

Dans une approche [*Infra as Code*](Infra as code in 5 minutes) les déploiements
devraient tous être identiques. En pratiques il y a toujours des différences
entre nos environnements.

Aujourd'hui, nous allons parler de la production, le plus importants des
déploiements.

<!--more-->

## La checklist de mise en production

Les développeurs ont souvent tendance à considérer leur travail comme terminée
quand le logiciel est livré, leur pull request est mergé.

Pour chaque produits que je dois mettre en production, je vérifie toute une
liste de points qui ont chaquun leur importance et leur criticité. Je vais en
lister quelques uns ici et ensuite expliquer briévement de quoi il retourne:

### 1- Disponibilités et réplications
### 2- Sauvergardes et restaurations
### 3- Monitoring et Alerting
### 4- Montées de version et scalabilité
