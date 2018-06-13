---
categories: work devops sre
custom_css: posts.css
date: 2018-05-30 13:04:45
img: https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Fire_fighters_practice_with_spraying_equipment%2C_March_1981.jpg/1200px-Fire_fighters_practice_with_spraying_equipment%2C_March_1981.jpg
layout: post
excerpt_separator: <!--more-->
language: fr
public: yes
title: "Devops et SRE, De quoi s'agit-il ?"
---

Dans le [précédent
article](https://romain.soufflet.io/services/work/devops/sre/2018/05/15/deploiements-en-production-sre-devops-et-autres-sujets-obscurs.html)
je parle de la production et de ce que cela implique de s'en occuper. Mais
qu'est-ce que ça a avoir avec les termes **DevOps** et **SRE** ? Je ne prétend
pas pouvoir donner une définition claire et universelle pour ces mots mais
j'aimerais pouvoir démystifier ces concepts.

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

## Différentes définitions et conflits

Cela fait maintenant plusieurs années que je m'intéresse aux équipes de
développements, aux comportements humains et sociaux en entreprises. C'est pour
cela que je me suis progressivement spécialisé dans des technologies et des
domaines d'expertise qui sont parfois appelé « outils DevOps ». Certaines
personnes font réfèrences à mon poste en utilisant le mot « DevOps ». C'est
d'autant plus vrai sur le plan du recrutement où on voit de plus en plus d'offre
portant ce nom sans rien préciser d'autre sur le projet ou l'équipe.

J'aimerais insister sur le fait que ce sont des facteurs humains qui m'ont
conduit à déployer des solutions techniques. Certainement pas l'inverse.

**DevOps est une culture**. On peut parler de mouvement, d'un ensemble de
bonnes pratiques à la limite, mais pas d'une discipline en tant que tel. Ce
n'est ni un rôle ni un ensemble d'outils.

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
de Google. Ben Treynor, le fondateur de l'équipe SRE chez Google, dit que c'est
ce qu'il se passe lorsque qu'on donne les tâches d'administration à une équipe
de développeurs.

Il est commun d'entendre que **SRE** est une implémentation concréte de la
culture **DevOps**. Pour l'expliquer nous allons donc plonger un peu plus dans
les notions fondamentales de la culture DevOps. Cette approche nous permet
d'avoir une image plus concréte des notions que nous avons évoqué, mais aussi de
fixer la notions **SRE**.

On peut discerner 5 pilliers dans la culture **DevOps**:

* Favoriser la communication dans l'entreprise
* Accepter et banaliser les erreurs
* Appliquer des changements plus petits et plus fréquements
* Automatiser les tâches les plus chronophages
* Relever tout les indicateurs qui pourraient être pertinents

### Faciliter la communication

Commençons par détailler l'aspect communication qui porte donc plus sur
l'organisation que sur des problématiques techniques. Il s'agit ici d'apporter
un véritable esprit d'équipe dans lequel on sensibilise chaque personnes aux
enjeus auxquels nous devons faire face. J'en parle dans un [précèdent article
(en anglais)](https://romain.soufflet.io) mais aussi dans mon interventions [«
Comment moderniser l'organisations de votre équipe de développement
»](https://romain.soufflet.io)

.. NOTE: Mettre la vidéo ?

On oppose souvent les organistions en silos à la culture **DevOps**. Le silos
c'est un grand conteneure à grains opaque que l'on compare au fonctionnement des
équipes refermé sur elles-même. L'organisations en silos mène parfois à des
situations génante où deux équipes peuvent travailler sur le même sujet sans
savoir que l'autres équipe le fait aussi. Où alors partir 6 mois sur un projet
qui n'apporte que très peu de valeur à l'entreprise. Rétablir la communication
permet de faire naître une meilleur ambiance de travail et économiser ce genre
de chantier.

Cependant, même si je vois énormement de critique vers l'organisations en silos,
je vois ce schémas très souvent appliquer. Ma conclusion ici, c'est que les
entreprises ne font pas exprés de siloter leurs équipes. J'en conclus aussi que
la communication est un effort à fournir. Il faut rester vigilant sur cette
aspect et être rigoureux pour continuer de fournir cette effort sur la durée
afin de ne pas retomber dans ces bons vieux silos.

### Accepter les erreurs

Le deuxième aspect de notre approche concerne la prise de risque et la
tolérance aux erreurs. C'est contre-intuitif pour une entreprise et par
conséquent l'un des points les plus difficile à mettre en place. On va d'abord
définir ce qu'est une erreur, et on va se mettre d'accord sur un taux d'erreur,
sur notre marge de manœuvre en temps qu'équippe technique.

Google va encore plus loin dans cette approche est parle d'un crédit d'erreur
qu'il nous faut dépenser, si l'équipe n'a pas eu assez de panne, c'est qu'ils ne
prennent pas assez de risques.

Sans aller jusqu'à faire un crédit pour casser la production, il est important
de rester réaliste. J'imagine que votre client voudra avoir 100% de temps de
production disponnible, mais l'effort technique pour atteindre cette objectif
est immense, peut être même impossible. On va donc essayer de négocier cette
partie et partir sur des niveau de services plus fiable comme 99% ou 95%.

Pour le petit paragraphe mathématiques, on va partir sur le nombre de secondes
dans une année. Et nous prenons avec les clients le temps de définir quels
duréer est-il acceptable de "perdre". Si vous acceptez d'être indisponible 1,68
heures par mois, vous serez à 99%. Et ce niveau de services est bien plus
réalisable que 100%.

### Augmenter les fréquences des déploiements

Troisièmement, nous allons découper les évolutions pour toujours avoir de petits
incréments sur le produit en production. On se repose ici sur la notions
d'industrialisation que je décris dans [mon précédent
article](https://romain.soufflet.io). Grâce à l'industrialisation, mettre ne
production est simple et rapide, plus la mise à jour est grande, plus elle
comporte de risque de casser un éléments. Heureusement, nous savons que notre
version N fonctionne correctement. Nous pouvons donc déployer notre version N+1,
voir si tout fonctionne, et re-déployer la version N si ça ne fonctionne pas
comme on le souhaite.

### Automatisation

* Ne pas automatiser pour automatiser
* N'automatiser que ce qui est utile de l'être
* Chercher où ce trouve la valeur, automatiser les tâches sans valeurs

### Les indicateurs

Et finalement, les metriques

* On ne parle pas des metriques en production
* Mesurer tout ce que vous pouvez
* Vos performances, vos déploiements, le temps de remise en service... etc...


### À quoi ressemble donc une entreprise avec du **SRE**

* Des équipes créativent et autonomes
* Tester sur des environnements créer à la volée
* Ne pas avoir peur de faire des erreurs peut être source d'inspiration

## Conclusion
