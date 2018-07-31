---
categories: devops sre ci cd
custom_css: posts.css
date: 2018-06-20 13:04:45
img: https://upload.wikimedia.org/wikipedia/commons/3/32/Lego_Color_Bricks.jpg
layout: post
excerpt_separator: <!--more-->
language: fr
public: no
title: "CI/CD from scratch, implement SRE from the beginning"
---

Beaucoup de développeur autour de mois veulent travailler sur des projets « from
scratch ». Cela signifie qu'on démarre un projet de zero et qu'il faudra tout
mettre en place soi-même.

Autant ces développeurs maitrisent vraiment bien tout les aspects projets, les
aspects production et pipelines de productions eux sont moins bien maitrisé. On
va explorer quoi faire et comment mettre tout ça en place sur un nouveau projet.

<!--more-->

Si vous voulez mettre tout ça en place sur un projet existant, je vous
conseilles de regarder mon intervention au SRE meetup

## The project

* README files
* Tests
* Linter
* Container or VM or Whatever

## Continuous Integration

* Start automatically : webhook
* Test and lint
* Build and upload

## Forging images

* Create automatically container from artifacts
* Design those image to be read-only
* Statefull vs Stateless

## Blue-Green

* How it works, How to update ?
* No downtime ?

## Logs collection and Metrics

* Layers you need to deploy
* Metrics and alert
* Scaling out
* Scaling down
* Les healtchecks

## Conclusion
