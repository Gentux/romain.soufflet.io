---
categories: work devops sre
custom_css: posts.css
date: 2018-05-30 13:04:45
img: https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Fire_fighters_practice_with_spraying_equipment%2C_March_1981.jpg/1200px-Fire_fighters_practice_with_spraying_equipment%2C_March_1981.jpg
layout: post
excerpt_separator: <!--more-->
language: fr
title: "Devops et SRE, De quoi s'agit-il ?"
---

Dans le précédent article (lien ici) je parle de la production. Mais qu'est-ce
que ça a avoir avec les termes **DevOps** et **SRE** ? Je ne prétend pas pouvoir
donner une définition claire et universelle pour ces mots mais j'aimerais
pouvoir démystifier ces concepts.

<!--more-->

Dans la pluparts des projets informatiques, nous avons une équipe de
développeurs et une équipe d'administrateurs systèmes. Cette organisation est
assez logique car on regroupe des unités fonctionnelles dans l'entreprise.
Cependant cela engendre de nombreux problèmes de communications.

Les développeurs d'un côté sont ammenés à développer de nouvelles
fonctionnalités, repercuter les changements demandé par les clients dans
l'application qu'ils construisent. Leur missions est caractèrisé par le
changement.

Les administrateurs de leur côté sont en charges du maintiens en conditions
opérationnel. Chaque mise à jour met en danger l'intégrité des produits ou des
services de l'entreprise, ainsi chaque changement est un risque. Leur missions
se caractèrise donc par la stabilité.

Par définition, ces deux rôles sont ammenés à être en conflit.

Et c'est dans ce contexte que naissent les notions **Devops** et **SRE**. Je
vais donc commencer par parler de ce qu'est **la culture DevOps**, puis des
travers que cela engendre. Ensuite je parlerai de **SRE**.

## La culture DevOps

La culture DevOps se présente en premier lieu sur le plan organisationnel. Il
s'agit d'abolir les barrière entre les équipes de développement et les équipes
d'administrateurs. Le but étant de réconcilier des missions ayant des objectifs
différents. **Nous travaillons dans la même entreprise, pour les mêmes clients,
nous devrions le faire ensemble**.

En s'affranchissant de ces barrière, on permet aux développeurs et
administrateurs de communiquer et collaborer. On obtient ainsi des développeurs
qui prennent conscience de ce qu'est la production et comment on s'en occupe,
mais aussi des administrateurs capable d'automatiser leurs besoins en
maintenances et les mécanismes de mises en production.

La collaboration permet aussi de redéfinir comment l'application se construit.
On passe d'un model ou les developpeur propose un paquet livrable avec une
documentation d'installation, a une collaboration à tout les niveau de
conception.

Les processus de livraisons qui en découlent ressemblent généralement à
celui-ci:

* L'idée ou le besoin émis par le client avec la collaboration de profils
  techniques
* Le développement de la fonctionnalité
* La revue de code et les tests automatisée
* Le tests fonctionnel, par le client directement si possible
* Le déploiements en production

On parle ici de culture **DevOps** ou de mouvement **DevOps** et on met en place
**l'amélioration continue**. En effet, vos équipes techniques se réunissent
autour d'une table et prennent le temps d'étudier leurs propres manières de
travailler. Ils identifient les passages douloureux afin d'apporter les
correction leur permettant d'augmenter leur vitesse et leur fiabilité.

En appliquant cette methode régulièrement, on se laisse le temps de faire
évoluer les use et coutume de l'entreprise progressivement, au rythmes des
humains qui travaillent sur le projet.

C'est un éléments central dans l'implémentation de la culture **DevOps**, tout
le monde est **DevOps** et tout le monde travail dans l'intérêt de l'équipe. Il
y a donc une très forte composante humaines dans l'équation.

## Les travers du mot « DevOps »

Cela fait maintenant plusieurs années que je m'intéresse aux équipes de
développements, aux comportements humains et sociaux en entreprises. C'est pour
cela que je me suis progressivement spécialisé dans des technologies et des
domaines d'expertise qui sont parfois appelé « outils DevOps ». Certaines
personnes font réfèrences à mon poste en utilisant le mot « DevOps ». C'est
d'autant plus vrai sur le plan du recrutement où on voit de plus en plus d'offre
portant ce nom sans rien préciser d'autre sur le projet ou l'équipe.

J'aimerais insister sur le fait que ce sont des facteurs humains qui m'ont
conduit à déployer des solutions techniques. Certainement pas l'inverse.

**DevOps est une culture. Ce n'est ni un rôle ni un ensemble d'outils**. On peut
parler de mouvement, d'un ensemble de bonnes pratiques à la limite, mais pas
d'une discipline en tant que tel.

Cependant, ces confusions nous donnes deux schémas récurrent dans le monde de
l'entreprise aujourd'hui:

L'équipe de développeurs renommé DevOps: Ils ont une liberté total sur leurs
déploiements, mais n'ont plus de support d'administrateurs systèmes pour les
aider à s'occuper de la supervision, de la sécurité, de la redondance des
services et autres sujets concernant les environnements de productions.

L'équipe d'aministrateurs renommé DevOps: Ils gardent les même rôles et
attributions, mais on leur demande en plus d'automatiser malgrés le fait qu'ils
n'ont pas forcement les compétences en développement pour le faire.

La questions suivantes est donc naturellement « Comment mettre en place cette
culture DevOps dans mes équipes ? ». Et c'est ici qu'on introduit la notions de
**SRE**. **SRE** et **DevOps** partagent les même principes fondateurs, et
beaucoup voit **SRE** comme une implémentation spécifique du mouvement
**DevOps** avec quelques extenssions.

## SRE: Site Reliability Engineer

L'ingénieur de fiabilité du site #faisTonCanadien est une notion qui nous viens
de Google. Ben Treynor, le fondateur de l'équipe SRE chez Google, décrit cela en
disant que c'est ce qu'il se passe lorsque qu'on donne les tâches
d'administration à une équipe d'ingénieur logiciel.

Reparlons briévement de DevOps. On peut découper plusieurs id

DevOps defines 5 key pillars of success:

    Reduce organizational silos
    Accept failure as normal
    Implement gradual changes
    Leverage tooling and automation
    Measure everything

SRE satisfies the DevOps pillars as follows:[2]

    Reduce organizational silos
        SRE shares ownership with developers to create shared responsibility[3]
        SREs use the same tools that developers use, and vice-versa
    Accept failure as normal
        SREs embrace risk[4]
        SRE quantifies failure and availability in a prescriptive manner using SLIs and SLOs[5]
        SRE mandates blameless post mortems[6]
    Implement gradual changes
        SRE encourages developers and product owners to move quickly by reducing the cost of failure[7]
    Leverage tooling and automation
        SREs have a charter to automate menial tasks (called "toil") away[8]
    Measure everything
        SRE defines prescriptive ways to measure values[9]
        SRE fundamentally believes that systems operation is a software problem




## Être créatifs

* D'autre environnements, à la volé
* Des mises à jours plus fréquente

## Conclusion

========================================


### Les développeur

Tout projets informatiques a besoin de développeur à la base. Les logiciels
sont tous issues de code source, écrit par des humains : Les développeur.

Ce code source est compliqué, plus facile à écrire qu'a lire. Et comme il a
été écrit par un humain, il comporte des erreurs. On peut facilement identifier
plusieurs familles d'erreurs.

* Des erreurs de syntaxe, de compilation : le logiciel ne fonctionne juste pas
* Des bugs, un comportement innatendu par le développeur
* Des erreurs fonctionnel, un traitement qui ne correspond pas à ce que le
  client souhaite
* Des fonctionnalité en trop, ou manquante.

```
* Des tests
 * Unitaire / Fonctionel, en fait je m'en fou
 * Qu'ils soient indépendant
* Une documentation
 * Pourquoi on écris une documentation
 * Quels type de documentation
```

### L'intégration
 * Environnement neutre
 * Collecte des logs
 * La livraison
### Le déploiement
 * Le maintiens en conditions opérationnel
 * Le fail recovery
### La culture devops
 * L'Onboarding, Facilité l'arrivé de nouveau membre
 * Savoir que faire quand quelqu'un part
 * Le monitoring
 * La sécurité

## Continuous Whatever (2/4) : Continuous Integration

### Ça veut dire quoi ?
 * L'intégration
 * Automatiquement ? Really ?

### OK, mais pourquoi ?
 * Parce que si on fait économiser du temps, on peut développer plus de chose
 * L'environnement est neutre
 * On repart toujours "from scratch" donc la mise en prod posera moins de problème

### Comment je met ça en place moi ?
 * Différentes étapes pour bootstrapper le travail
 * Instaurer la culture "continous truc" dans l'équipe

## Continuous Whatever (3/4) : Continuous Delivery

### Plus loin que l'intégration
 * Relire la partie sur l'intégration
 * Intégration et Déploiement sont deux choses distincte
 * Note sur les downtime => BlueGreen

### Les validations
 * On va valider avant de déployer
 * Les données de tests
 * Les accés à la production

### Le résultat
 * Le temps de mise en prod
 * Le taux d'erreurs
 * Dire non aux devs et aux clients

## Continuous Whatever (4/4) : Pipeline de production

### Continuous Integration + Continuous Delivery
 * From code to Production

### Les validations : Version 2
 * Tout n'est pas automatisable
