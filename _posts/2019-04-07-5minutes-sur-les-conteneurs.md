---
categories: docker container infrastructure
custom_css: posts.css
date: 2019-05-22 12:32:10
img: "https://s3.eu-west-2.amazonaws.com/gentux/Images/Containers.jpg"
layout: post
toporder: 2
excerpt_separator: <!--more-->
language: fr
public: yes
title: "5 minutes pour les conteneurs (docker)"
---

En informatique, coexistent de nombreuses technologies. Dans tout cet
écosystème, il y a des technos qui naissent, d'autres qui meurent, mais il y a
surtout des technos tellement *hype* et *funky* que passer à côté est un
exploit à part entière.

Dans ces technos hype, on peut trouver *docker*. Si vous travaillez en
informatique, vous avez sûrement entendu parler de docker ou plus généralement
de la notion de *conteneur*.

<!--more-->

Par contre, en avoir entendu parler ou l'avoir utilisé ne garantit pas la
compréhension de l’ensemble ni sa bonne utilisation. Alors si on en parlait ?
Notre objectif : 5 minutes de lecture pour comprendre les conteneurs.

## C'est quoi un conteneur en informatique ?

Avant d’aborder le sujet des conteneurs je vais faire une digression sur les
[processus](https://fr.wikipedia.org/wiki/Processus_(informatique)).

Sur une machine, qu’elle soit virtuelle ou physique, on a un OS (Operating
System) dont le travail est de gérer des processus et leurs liens avec le
matériel. Basiquement, les applications que votre entreprise produit seront des
processus que l'OS  pourra exécuter et gérer sur les machines de production.

Pour qu'un processus fonctionne correctement, en simplifiant il lui faudrait 3
éléments:

* De la puissance de calcul (accès au CPU, la RAM, les ressources matérielles)
* Du stockage, pour garder les données qu'on peut réutiliser plus tard
* Du réseau, pour communiquer avec l'extérieur, notamment les clients

Le *conteneur*, c'est la boîte qui va donner ces 3 éléments aux `processus`.

## Pourquoi utiliser un conteneur ?

Un processus, avec ou sans conteneur, effectue le même travail. J'irai même
jusqu'à dire qu'il va légèrement plus vite sans conteneur. Alors pourquoi cette
euphorie autour des conteneurs ?

En un mot : l'Isolation. C'est là que le mot conteneur est très bien choisi :
on place le processus dans une boîte où il se retrouve seul.

Un conteneur n'a pas accès aux autres conteneurs, ils ne savent pas que
d'autres peuvent exister sauf si on les relie entre eux explicitement. Ainsi,
en regardant la configuration de nos conteneurs, on sait quelles applications
tournent et comment elles communiquent entre elles.

Donc pour faire une liste non-exhaustive:

* Sécurité, un processus A n'a pas accès aux fichiers manipulés par le processus
  B
* Sécurité, le processus n'a accès qu'aux ressources réseaux qu'on a défini
  pour lui
* Portabilité, quel que soit l'OS sur lequel on utilise nos conteneurs, ils
  fonctionneront de la même manière
* Possibilité pour les développeurs d'utiliser le même conteneur dans leurs
  phases de tests et en production et ainsi réduire les sources d'erreurs
* Clarté de l'infrastructure, lister les conteneurs et leurs configurations suffit
  pour présenter l'ensemble de la solution déployée

## Doit-on dire « Docker » ou « Conteneur » ?

Alors oui, il y a souvent confusion parce que *docker* est l'outil le plus
utilisé et le plus connu actuellement pour faire des *conteneurs* mais en
réalité ce n'est qu'un moteur parmi d'autres. N'hésitez pas à vous
renseigner sur le site d'[Open Container
Initiative](https://www.opencontainers.org/) (*OCI*).

La volonté d'*OCI* est de définir un standard industriel pour utiliser les
conteneurs. Pour cela, il définit deux normes. La première est *runtime-spec*
qui spécifie comment doit être exécuté un conteneur. La deuxième est
*image-spec* pour définir comment sauvegarder, partager et réutiliser les
images de conteneur.

## Les images ?

Une image de conteneur est une archive qui contient tout ce dont votre
conteneur a besoin pour être exécuté. Vous pourrez donc l'utiliser sur
différentes machines.

Ces images peuvent être partagées, copiées, modifiées puis repartagées. Si je
prend l'image du projet *nginx* par exemple, elle est quotidiennement utilisée
par des milliers d'entreprises.  Nous pouvons donc en déduire que l'image est
fiable.

## On avait dit 5 minutes !

Arf, j'ai dépassé, mais au moins vous avez du contenu pour pouvoir répondre si
on vous parle de conteneur maintenant.

À vous de jouer ! ;)
