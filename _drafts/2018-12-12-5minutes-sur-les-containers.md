---
categories: kubernetes work infrastructure
custom_css: posts.css
date: 2018-12-12 15:51:00
img: "https://s3.eu-west-2.amazonaws.com/gentux/Images/DevObs.jpeg"
layout: post
excerpt_separator: <!--more-->
language: fr
public: yes
title: "5 minutes sur les Container"
---

En informatique, il y a pleins de technologies. Dans tout cet écosystem, y a des
technos qui naissent, d'autres qui meurent mais il y a surtout des technos
tellement *hype* et *funky* que passer à côté est un exploit à part entiére.

Dans ces technos *hype*, on peut trouver *docker*. De nos jours, toutes personne
en informatique à au moins entendu parler de *docker* et plus généralement des
*container*.

Par contre, en avoir entendu parler ou l'avoir utiliser, ça ne garantie pas que
vous sachiez ce qu'est un container. Alors on passe rapidement au vif du sujet,
5 minutes pour comprendre les containers.

<!--more-->

# C'est quoi un container ?

On a pas le temps de faire trop de détour, mais avant les container je vais
quand même faire 2 petits paragraphes sur les *processus*.

Sur une machine, qu'elle soit virtuelle ou physique, on a une *OS* (Operating
System) dont le travail est simplement de gérer des *processus*. Basiquement,
les applications que votre entreprise produit seront des *processus* pour l'*OS*
sur les machines de production.

Pour qu'un *processus* fonctionne correctement, je simplifie un peu, il lui faut
3 éléments :

* Puissance de calcul (accés au CPU, la RAM, les ressources matériels)
* Du stockage, pour garder les données qu'on peut réutiliser plus tard
* Le réseau, pour communiquer avec l'extérieur, notammenet les clients.

Le *container*, c'est la boîte qui va donner ces 3 éléments à vos processus.

# Pourquoi utiliser un container ?

Quand je lance un processus sur ma machine, tout seul, il fait la même choses
que le même processus dans un container. J'irai même jusqu'à dire qu'il va
légèrement plus vite. Alors pourquoi cette euforie ?

En un mot : *l'Isolation*. C'est là que le mot *container* est très bien
choisit, on place le processus dans une boîte où il est tout seul.

Un container n'a pas accés aux autres container, ils ne savent pas que d'autres
peuvent exister sauf si on les relit entre eux explicitement. Ainsi, quand on
déplois plusieurs application en container, on sait quels applications tourne,
et comment elles communiquent entre elle, et pour savoir tout ça, on est pas
obligé d'avoir fait des schéma sur un fichier PDF quelques part dans le wiki de
l'entreprise.

Donc pour faire une courte liste non-exhaustive:

* Sécurité, un processus A n'a pas accés au fichiers manipulé par le processus B
* Sécurité, le processus n'a accés que aux ressources réseau qu'on a définit
  pour lui
* Pas d'adérence avec l'OS, que ce soit un GNU/Linux Debian ou Arch, le
  container fonctionnera tout pareil
* Possibilité pour les développeur d'utiliser le même container qu'en production
  et ainsi tester leurs évolutions dans un environnement similaire.

# On dit « Docker » ou « Container » ?

Alors oui, y a souvent confusions parce que *docker* est l'outil le plus utilisé
et le plus connu actuellement pour faire des *container*.

Mais en réalité, *docker* n'est qu'un moteur pour faire des *container*, vous
pouvez aussi utiliser :

* Docker, c'est un moteur pour avoir des container
* Il y en a d'autres.
* Open Container Initiative
* Standard industriel

# On avait dis 5 minutes !

Arf, j'ai dépassé, mais au moins vous avez de quoi répondre si on vous parle de
container maintenant.

À vous de jouez ! ;)
