---
categories: ci cd process work
custom_css: posts.css
date: 2019-06-22 15:51:00
img: "https://s3.eu-west-2.amazonaws.com/gentux/Images/DevObs.jpeg"
layout: post
excerpt_separator: <!--more-->
language: fr
public: yes
title: "5 minutes pour comprendre la CI/CD"
---


C'est *LA* notion à la mode sur toutes les offres d'emplois. De quoi s'agit-il
concrétement ?

On va aller droit au but:

 * CI est l'abbréviation de `Continuous Integration` ou `Intégration Continue`
   en français
 * CD est l'abbréviation de `Continuous Deployment` ou `Déploiement Continue` en
   français

<!--more-->

## Intégration

Mettre en commun les développement

L'intégration continue est un ensemble de pratiques utilisées en génie
logiciel consistant à vérifier à chaque modification de code source que le
résultat des modifications ne produit pas de régression dans l'application
développée. Le concept a pour la première fois été mentionné par Grady Booch et
se réfère généralement à la pratique de l'extreme programming. Le principal but
de cette pratique est de détecter les problèmes d'intégration au plus tôt lors
du développement. De plus, elle permet d'automatiser l'exécution des suites de
tests et de voir l'évolution du développement du logiciel.

## Construire l'application : La compilation

## Tester l'application




# Feedback
## votre première expérience# Misc## quelle plateforme ?
- Jenkins
- Codeship
- travis
- circleCI
- GitLab-ci## où s'arrête la CI où commence la CD# on fait quoi dans la CI ? - couverture de code
- lint
- syntaxe
- tests
- Package deployable à définir
   - image docker
   - release (tgz des sources)# CD quand ? Workflow
- Gitflow
- gitlabflow
- githubflow
- trunk based # gouvernance et problèmes de sécurité # CI et microservices# CI pour tout ? js?# a quel point fait-on confiance ?# feature flag ?/ dr# repository driven
