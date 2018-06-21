---
categories: work devops sre
custom_css: posts.css
date: 2018-06-21 17:56:25
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
article](https://romain.soufflet.io).

Grâce à l'industrialisation, mettre ne production est simple et rapide, plus la
mise à jour est grande, plus elle comporte de risque de casser un éléments.

Heureusement, nous savons que notre version actuel (appelé **N**) fonctionne
correctement. Nous pouvons donc déployer notre version suivante (appelée
**N+1**), voir si tout fonctionne, et re-déployer la version **N** si ça ne
fonctionne pas comme on le souhaite.

Nous avons parfois même un model inverse où une version **N+1** ne fonctionne
pas et lorsque l'on consulte les développeurs de l'application pour en discuter,
la bonne solution qui emmerge est de déployer tout de suite la version **N+2**.

Augmenter le nombre et la fréquence des mises à jour devient dés lors un gage de
stabilité. Et ceci ne serait pas possible sans la marge de manœuvre négocié en
amont (cf: Accepter les erreurs).

### Automatisation

Un aspect des plus important est l'automatisation. La plupart des équipes SRE
cultive une vision utopiste de leur plateforme. Une vision dans laquel ils
n'auraient juste plus de travail et pourraient rentrer chez eux alors que la
production fonctionne parfaitement.

Pour atteindre ce but, nous avons recours à l'automatisation. Cela veut
simplement dire que nous allons écrire un programme pour faire notre travail à
notre place. Cela parait simple dis comme cela.

L'inconvénient majeure de l'automatisation, c'est que écrire du code implique
immédiatement la création de bogue, de comportements innatendu. Mais cela
implique aussi qu'il faut maintenir ces programmes et les faire évoluer avec
l'entreprise.

Nous devons donc être prudent sur cette partie, et bien réflechir avant de se
lancer dnas un chantier d'automatisation. Ce point créer parfois plus de
problème qu'il n'en résout.

Alors que d'un autres côté, les avantages sont indéniables, le gain de temps
à long terme est indéniable et nous gagnons aussi beaucoup en fiabilité sur les
tâches automatisée. Les différentes action sont aussi plus rapide car nous
n'hésitons plus avant de lancer un script : Cela coûte du temps machine, peu
cher, contrairement au temps humain.

L'automatisation nous apporte aussi une plateforme neutre, indépendante des
machines sur lesquels les développeur travaillent. On peut ainsi être sûr et
certains que le programme fonctionne correctement quelque soit la machine qui
l'éxecutera. Et si on pousse ce raisonnement plus loin, on fera en sorte de
créer nos environnements de tests automatisée au plus proche de ce que sera
l'environnement de production final. On évite ainsi au maximum les erreurs qui
surviennent lorsque l'ont change des éléments entre l'environnement de
développement et l'environnement de production.

### Les indicateurs

Et finalement, parlons de la mise en place des métriques. Tout comme pour
l'automatisation, il faut rester vigilant à ne pas se laisser entrainer par une
campagne de recolte de métrique qui pourrait être innutile.

Pour qu'un métrique soit utile, il faut être en mesure de la comprendre et de
mener des actions face à elle. Ainsi, si votre mesure concerne la moyenne des
tailles de chaussures dans votre équipe, vous pourrez comprendre la mesure, mais
vous ne serez pas en mesure de prendre des décisions. Par contre, mesurer le
nombre d'utilisateurs par minutes sur la production peut vous permettre
de mener les actions qui permettront de tenir la charge.

Restons donc le plus pragmatique possible et posons nous toujours ces deux
questions pour chacune des metriques que nous mettons en place:

* Que signifie notre mesure ?
* Quelles actions pouvons nous mettre en places lorsque la mesure varie ?

Il faut aussi garder à l'esprit que nous pouvons mettre toute sorte de mesure en
place, ce n'est pas un domaine uniquement technique. Un autre exemple de mesure
qui a pu m'être utile par le passé est le nombre de déploiement par semaine :
lorsque l'indicateurs à commencé à baisser, nous avons identifié une difficulté
croissante dans la création des nouvelles fonctionnalité, et nous avons donc pu
acter qu'il nous fallait refaire un travail de fond sur notre base de code pour
améliorer la situation.

Vos métrique peuvent donc être de nature managériale, porter sur le
développement des nouvelles fonctionnalité, sur le nombre de tickets ouvert ou
fermer ou simplement sur la production qui tourne actuellement.

Finissons ce sujets avec un dernier point d'attention. Imaginons que vous avez
mesurer la satisfaction de vos équipes via un formulaire que chaque membre doit
remplir à la fin de la semaine. Au bout de 3 semaines, votre indicateurs à
légérement baissé et vous décidez d'offrir des croissants pour toute l'équipe.
Deux semaines plus tard, le niveau rebaisse et vous achetez de nouveau des
croissants. Il est fort probable que suite à cela, les formulaires soit toujours
remplit négativement : vos équipes ont trouvé un moyen d'obtenir des croissants
et vous ne savez plus du tout où en est le niveau de satisfaction.

## Conclusion : À quoi ressemble donc une entreprise avec du **SRE**

Je ne vais pas mentir, intégrer tout ces aspects dans la vie de votre entreprise
n'est pas chose aisé. Mais rêvons un peu, et imaginons que c'est le cas, à quoi
ressemble notre quotidien désormais ?

Les développeurs, les profils **SRE** et les administrateurs travaillent mains
dans la mains. Ça ne veut pas dire qu'ils sont toujours d'accord, bien au
contraire, mais ils discutent autour de leur différences et contraintes et
trouvent de meilleurs solutions.

La créativités de nos équipes augmente, de nouvelles idées emergent et
peuvent être testé, car les développeurs n'ont plus peur de demander plus de
ressource sur les différents environnement de tests et même de production. Et
dans le même temps, les administrateurs osent demander des ajustements
particulier aux développeurs afin d'avoir une architecture plus stable et
pérenne.

Mais le point le plus important, c'est l'accéleration du cycle de valeur de
votre entreprise. Passer de l'idée à la mise en production prend moins de temps
et se trouve être plus fiable que jamais. On passe de l'idée à la conception,
puis la réalisation, les tests, la validation et la mise en production en un
temps reccord et en respectant chaque rôle dans la chaîne.

Bien que tout ne soit jamais parfait, le cadre de travail obtenu de la sorte est
très agréables à vivre et pourrait même avoir des effet bénéfique sur les aspect
recrutement.

## Prochainement

Je prévois d'écrire prochainement un article sur les architectures immutables
ainsi qu'un article sur la transitions d'une équipe « classique » sur un modéle
plus proche de **SRE**.

Cependant, l'écriture me prenant beaucoup de temps, je ne pourrais m'occuper que
d'un article à la fois, n'hésitez pas à me dire ce que vous en pensez dans les
commentaires, par mail, sur twitter ou linkedin :)
