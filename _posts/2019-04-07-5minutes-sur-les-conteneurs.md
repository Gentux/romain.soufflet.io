---
categories: docker container infrastructure
custom_css: posts.css
date: 2019-04-07 12:32:10
img: "https://s3.eu-west-2.amazonaws.com/gentux/Images/Containers.jpg"
layout: post
excerpt_separator: <!--more-->
language: fr
public: yes
title: "5 minutes pour les conteneurs (docker)"
---

En informatique, coexistent de nombreuses technologies. Dans tout cet
écosystème, il y a des technos qui naissent, d'autres qui meurent mais il y a
surtout des technos tellement *hype* et *funky* que passer à côté est un
exploit à part entière.

Dans ces technos hype, on peut trouver *docker*. Si vous travaillez en
informatique, vous avez sûrement entendu parler de docker ou plus généralement
de la notion de *conteneur*.

<!--more-->

Par contre, en avoir entendu parler ou l'avoir utilisé ne garantit pas la
compréhension de l’ensemble ni sa bonne utilisation. Alors si on en parlait ?
Notre objectif : 5 minutes de lecture pour comprendre les conteneurs.

# C'est quoi un conteneur en informatique ?

Il s’agit d’en venir rapidement au fait mais avant d’aborder le sujet des
conteneur je vais quand même faire une digression sur les
[processus](https://fr.wikipedia.org/wiki/Processus_(informatique)).

Sur une machine, qu’elle soit virtuelle ou physique, on a un OS (Operating
System) dont le travail est de gérer des processus et leurs liens avec le
matériel. Basiquement, les applications que votre entreprise produit seront des
processus que l'OS  pourra exécuter et gérer sur les machines de production.

Pour qu'un processus fonctionne correctement, en simplifiant il lui faudrait 3
éléments :

* De la puissance de calcul (accès au CPU, la RAM, les ressources matérielles)
* Du stockage, pour garder les données qu'on peut réutiliser plus tard
* Du réseau, pour communiquer avec l'extérieur, notamment les clients.

Le *conteneur*, c'est la boîte qui va donner ces 3 éléments à vos processus.

# Pourquoi utiliser un conteneur ?

Quand je lance un processus sur ma machine, il fait la même chose seul, que ce
que ferait le même processus dans un conteneur. J'irai même jusqu'à dire qu'il
va légèrement plus vite. Alors pourquoi cette euphorie autour des conteneurs ?

En un mot : l'Isolation. C'est là que le mot conteneur est très bien choisit :
on place le processus dans une boîte où il se retrouve seul.

Un conteneur n'a pas accès aux autres conteneurs, ils ne savent pas que
d'autres peuvent exister sauf si on les relie entre eux explicitement. Ainsi,
en regardant la configuration de nos conteneurs, on sait quelles applications
tournent et comment elles communiquent entre elles.

Donc pour faire une liste non-exhaustive:

* Sécurité, un processus A n'a pas accès au fichiers manipulés par le processus
  B
* Sécurité, le processus n'a accès qu'aux ressources réseaux qu'on a définit
  pour lui
* Portabilité, quelque soit l'OS sur lequel on utilise nos conteneur, ils
  fonctionneront de la même manière.
* Possibilité pour les développeurs d'utiliser le même conteneur dans leurs
  phases de tests qu'en production et ainsi réduire les sources d'erreurs.
* Clareté de l'infrasture, lister les conteneur et leurs configurations suffit
  pour présenter l'ensemble de la solution déployée

# Doit-on dire « Docker » ou « Conteneur » ?

Alors oui, y a souvent confusions parce que *docker* est l'outil le plus
utilisé et le plus connu actuellement pour faire des *conteneur*.

Mais en réalité, *docker* n'est qu'un moteur parmis d'autres. N'hésitez pas à
vous renseigner sur le site d'[Open Container
Initiative](https://www.opencontainers.org/) (*OCI*).

La volonté d'*OCI* est de définir un standard industriel pour utiliser les
conteneurs. Pour cela, il définit deux normes. La première est *runtime-spec*
qui spécifie comment doit être executé un conteneur. La deuxième est
*image-spec* pour définir comment sauvegarder, partager et réutiliser les
images de conteneur.

# Les images ?

Une image de conteneur est une archive qui contient tout ce dont votre
conteneur a besoin pour être exécuté. Vous pourrez donc l'utiliser sur
plusieurs machines.

Ces images peuvent être partagées, copiées, modifiées et repartagées pour faire
des produits communautaires. Comme peut l'être l'image du projet *nginx* qui
est quotidiennement utilisée par des milliers d'entreprises. Nous pouvons donc
en déduire que l'image est un système fiable.

# On avait dis 5 minutes !

Arf, j'ai dépassé, mais au moins vous avez du contenu pour pouvoir répondre si
on vous parle de conteneur maintenant.

À vous de jouez ! ;)
