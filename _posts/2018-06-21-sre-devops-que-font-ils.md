---
categories: work devops sre
custom_css: posts.css
date: 2018-06-21 17:56:25
img: https://s3.eu-west-2.amazonaws.com/gentux/Images/SpaceX_Dragon.png
layout: post
excerpt_separator: <!--more-->
language: fr
public: yes
title: "Devops et SRE, De quoi s'agit-il ?"
---

Dans le [précédent
article](https://romain.soufflet.io/services/work/devops/sre/2018/05/15/deploiements-en-production-sre-devops-et-autres-sujets-obscurs.html)
je parle de la production et de ce que cela implique de s'en occuper. Mais
qu'est-ce que ça a avoir avec les termes **DevOps** et **SRE** ? Je ne prétends
pas pouvoir donner une définition claire et universelle pour ces mots mais
j'aimerais pouvoir démystifier ces concepts.

<!--more-->

Dans la plupart des projets informatiques, nous avons une équipe de
développeurs et une équipe d'administrateurs systèmes. Cette organisation est
assez logique, car on regroupe des unités fonctionnelles dans l'entreprise. Il
en va de même pour l'équipe comptable, l'équipe commerciale et toutes les
autres.  Cependant cela engendre de nombreux problèmes de communications.

Les développeurs d'un côté sont amenés à développer de nouvelles
fonctionnalités, répercuter les changements demandés par les clients dans
l'application qu'ils construisent et corriger les éventuelles erreurs remontées
par les utilisateurs. Leur mission est caractérisée par les évolutions du code
source qu'ils écrivent, par le changement.

Les administrateurs de leur côté sont en charges du maintien en conditions
opérationnel. Chaque mise à jour met en danger l'intégrité des produits ou des
services de l'entreprise, ainsi chaque changement est un risque. Leur mission se
caractérise donc par la stabilité.

Par définition, ces deux rôles sont amenés à être en conflit.

Et c'est dans ce contexte que naissent les notions **Devops** et **SRE**. Je
vais donc commencer par parler de ce qu'est **la culture DevOps**, puis des
travers que cela engendre. Ensuite je parlerai de **SRE**.

## La culture DevOps

La culture DevOps se présente en premier lieu sur le plan organisationnel. Il
s'agit d'abolir les barrières entre les équipes de développement et les équipes
d'administrateurs. Le but étant de réconcilier des missions ayant des objectifs
différents: **Nous travaillons dans la même entreprise, pour les mêmes clients,
nous devrions le faire ensemble**.

En s'affranchissant de ces barrières, on permet aux développeurs et
administrateurs de communiquer et collaborer. On obtient ainsi des développeurs
qui prennent conscience de ce qu'est la production et comment on s'en occupe,
mais aussi des administrateurs capable d'automatiser leurs besoins en
maintenances et les mécanismes de mises en production.

La collaboration permet aussi de redéfinir comment l'application se construit.
On passe d'un modèle en deux étapes ou les développeurs proposent un paquet
livrable et des administrateurs qui l'installent tant bien que mal a une
collaboration à tous les niveaux de conception.

En généralisant un peu, on arrive à un processus qui ressemble à ça:

![SRE
Workflow](https://s3.eu-west-2.amazonaws.com/gentux/Images/SRE+Workflow.png)

Et pour chacune des étapes sur le schéma, les différents profils pourront
s'entraider:

* Définir les tâches suites aux idées ou besoins émis par le client
* Développer / Exécuter cette tâche
* La revue de code et les tests automatisée, sur une infra le plus proche
  possible de que sera la plateforme de production
* Les tests fonctionnels, par le client directement si possible, sur un
  environnement clone de la production
* Le déploiement en production, automatisée et le moins d'erreur possible

On introduit de cette manière la notions de **pipeline** de production. À
l'image des chaînes d'assemblage automobile. Parfois, on parle aussi **d'usine
logicielle** pour désigner les chaînes tel que celles-ci.

Puis on met en place **l'amélioration continue**. Les équipes techniques se
réunissent autour d'une table et prennent le temps d'étudier leurs propres
manières de travailler. Ils identifient les passages douloureux afin d'apporter
les corrections leur permettant d'augmenter leur vitesse et leur fiabilité.

En appliquant cette méthode régulièrement, on se laisse le temps de faire
évoluer les use et coutume de l'entreprise progressivement, au rythme des
humains qui travaillent sur le projet.

C'est un élément central dans l'implémentation de la culture **DevOps**, tout
le monde est **DevOps** et tout le monde travail dans l'intérêt de l'équipe. Il
y a donc une très forte composante humaines dans l'équation.

## Différentes définitions et conflits

J'aimerais insister sur le fait que ce sont des facteurs humains qui m'ont
conduit à déployer des solutions techniques. Certainement pas l'inverse.

**DevOps est une culture**. On peut parler de mouvement, d'un ensemble de
bonnes pratiques à la limite, mais pas d'une discipline en tant que tel. Ce
n'est ni un rôle ni un ensemble d'outils.

Et pourtant, de plus en plus d'offres d'emplois ou de missions porte le titre
DevOps et n'ont aucune précisions sur l'équipe ou l'organisation actuel de
l'entreprise. La pluparts de ces offres cherchent le profils en or qui pourra
leur apporter cette culture DevOps et mettre en place leur usine logiciel.

Or il est très difficile pour un profil seul de mettre en place tout les outils
dont l'entreprise à besoin, et même si les outils sont installé et configuré,
faut-il encore que les employés s'en servent.

Par conséquent, la confusion **culture** / **profil** DevOps nous donnes deux
schémas récurrent dans le monde de l'entreprise aujourd'hui:

Premièrement l'équipe de développeurs renommé DevOps: Ils ont une liberté total
sur leurs déploiements, mais n'ont plus de support d'administrateurs systèmes
pour les aider à s'occuper de la supervision, de la sécurité, de la redondance
des services et autres sujets concernant les environnements de productions.

Et deuxièmement l'équipe d'aministrateurs renommé DevOps: Ils gardent les même
rôles et attributions, mais on leur demande en plus d'automatiser malgrés le
fait qu'ils n'ont pas forcement les compétences en développement ou l'expérience
pour le faire.

La questions qu'on se pose donc naturellement est : « Comment mettre en place
cette culture DevOps dans mes équipes ? ». Je n'ai malheureusement pas de
réponse toute faites à cette question, et suivant l'entreprise, les projets et
les équipes en place les grandes étapes peuvent changer.

Si je ne parle pas de ces grandes étapes dans cette article, c'est parce que
pour bien comprendre les actions à mettre en place, nous avons besoin de creuser
encore un peu le sujets **DevOps**.

Et c'est ici qu'on introduit la notions de **SRE**. **SRE** et **DevOps**
partagent les même principes fondateurs, et beaucoup voit **SRE** comme une
implémentation spécifique du mouvement **DevOps** avec quelques extenssions.

Je compte tout de même écrire prochainement un article complet sur la reprise de
projets et l'implémentation de bonnes pratique pour une transitions vers une
culture devops.


## SRE: Site Reliability Engineer

L'ingénieur de fiabilité du site #faisTonCanadien est une notion qui nous viens
de Google. Ben Treynor, le fondateur de l'équipe SRE chez Google, dit que c'est
ce qu'il se passe lorsque qu'on donne les tâches d'administration à une équipe
de développeurs. C'est un terme récent, et je n'ai d'ailleurs pas trouvé de
traduction officiel en français.

Il est commun d'entendre que **SRE** est une implémentation concréte de la
culture **DevOps**. Première bonne nouvelle, c'est qu'on parle bien de profil
**SRE** puisque le terme « Engineer » en anglais fait référence à un ingénieur,
donc une personne.

Nous allons donc plonger un peu plus dans les notions fondamentales de la
culture DevOps. Cette approche nous permet d'avoir une image plus concréte des
notions que nous avons évoqué, mais aussi de fixer la notions **SRE**.

Commençons par discerner 5 pilliers dans la culture **DevOps**:

* Faciliter la communication dans l'entreprise
* Accepter et banaliser les erreurs
* Appliquer des changements plus petits et plus fréquements
* Automatiser les tâches les plus chronophages
* Relever tout les indicateurs qui pourraient être pertinents

### Faciliter la communication dans l'entreprise

Commençons par détailler l'aspect communication qui porte donc plus sur
l'organisation que sur des problématiques techniques. Il s'agit ici d'apporter
un véritable esprit d'équipe dans lequel on sensibilise chaque personnes aux
enjeux auxquels nous devons faire face. J'en parle dans un [précèdent article
(en anglais)](https://romain.soufflet.io) mais aussi dans mon interventions [«
Comment moderniser l'organisations de votre équipe de développement
»](https://romain.soufflet.io)

<iframe width="560" height="315"
src="https://www.youtube.com/embed/AS0v8oREpw8?rel=0" frameborder="0"
allow="autoplay; encrypted-media" allowfullscreen></iframe>

On oppose souvent les organistions en silos à la culture **DevOps**. Le silos
c'est un grand conteneure à grains opaque que l'on compare au fonctionnement des
équipes refermé sur elles-même. À l'image de ces conteneurs, nous retrouvons un
fonctionnement opaque (manque de communication) et le moins de contacts possible
avec l'extèrieur.

L'organisations en silos mène parfois à des situations génante où deux équipes
peuvent travailler sur le même sujet sans savoir que l'autres équipe le fait
aussi. Où alors partir 6 mois sur un projet qui n'apporte que très peu de valeur
à l'entreprise.

Cependant, détruire ces silos et rétablir la communication peut parfois être mal
vécu, n'oublions pas que les équipes sont constituées d'être humains qui ont
leur repaires et leurs habitudes. J'ai globalement pu obsever que rétablir la
communication permet de faire naître une meilleur ambiance de travail et
économiser du temps, mais cela passe toujours par une période transitoire qui
n'est pas toujours facile à vivre.

De plus, une fois que la communication reviens, il faut rester vigilant afin de
maintenir ce niveau de communication. C'est un effort constant à fournir, au
risque de tomber de nouveau dans une organisations en silos.

Dans ce contexte, notre profil *SRE* aurait tendance à mettre en place les
outils permettant aux équipes de communiquer. Que cela passe par des listes de
diffusions ou des feuilles de papier collé les portes des autres bureau.

L'incorporation d'une personne ayant une culture DevOps ou ayant le rôle SRE est
aussi une bonne occasion d'identifier les manques de communication entre équipe.


### Accepter et banaliser les erreurs

Le deuxième aspect l'approche **SRE** concerne la prise de risque et la
tolérance aux erreurs. C'est contre-intuitif pour une entreprise et par
conséquent l'un des points les plus difficile à mettre en place.

On va d'abord définir ce qu'est une erreur, et on va se mettre d'accord sur un
taux acceptable d'erreur, sur notre marge de manœuvre. Dans notre cas, on parle
de taux de fiabilité sur l'environnement de production, il s'agit du pourcentage
de temps pendant lequel le service est en conditions opérationnel.

Pour le petit paragraphe mathématiques, on va partir sur le nombre de secondes
dans une année. Et nous définissons avec les clients la durée qu'il est
acceptable de "perdre". À 100%, nous considérons que nous ne voulons pas une
seule seconde d'indisponnibilité. À 99% nous serons indisponible 7,2 heures par
mois.

La logique est simple, maintenir un service à 100% demande des efforts
considérables, je pense même que cela est impossible pour la plupart des
entreprises. Alors que maintenir un service pour 99% du temps est relativement
choses aisée. Nous disposons de 7 heures et 15 secondes pour réparer la
production si quelques choses tourne mal par mois.

Google va encore plus loin dans cette approche est parle d'un crédit d'erreur
qu'il nous faut dépenser, si l'équipe n'a pas eu assez de panne, c'est qu'ils ne
prennent pas assez de risques.

Sans aller jusqu'à faire un crédit pour casser la production, il est important
de rester réaliste. J'imagine que votre client voudra avoir 100% de temps de
production disponnible, mais l'effort technique pour atteindre cette objectif
est immense.

Dans l'approche **SRE**, on distingue d'autres notions sur les niveaux de
services, si le sujet vous intéresse, il s'agit des notions de **SLA**, **SLO**
et **SLI**. Je ne détaillerai pas ces notions ici, les différences sont assez
subtiles. Par contre, j'aimerai préciser que j'ai donnée ici des niveau de
service entier, on peut avoir des décimales, tel que 99.9% voire même 99.9999%.


### Augmenter les fréquences des déploiements

Troisièmement, dans une approche **SRE** nous allons découper les évolutions
pour toujours avoir de petits incréments sur le produit en production. On se
repose ici sur la notions d'industrialisation que je décris dans [mon précédent
article](https://romain.soufflet.io/services/work/devops/sre/2018/05/15/deploiements-en-production-sre-devops-et-autres-sujets-obscurs.html)

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
stabilité. De plus, ceci ne serait pas possible sans la marge de manœuvre
négocié en amont. Reparlons aussi briévement de l'aspect communication, car la
décision de revenir en arrière où de reprendre une fonctionnalité de plus ce
fait mains dans la mains avec les équipes de développements et en accord avec
les équipes de production.

On commence à voir les bénéfices de notre rôle **SRE**.

### Automatisation

Un aspect des plus important est l'automatisation. La plupart des équipes
**SRE** cultive une vision utopiste de leur plateforme. Une vision dans laquelle
ils n'auraient plus de travail et pourraient rentrer chez eux alors que la
production fonctionne parfaitement.

Pour atteindre ce but, nous avons recours à l'automatisation. Cela veut
simplement dire que nous allons écrire des programmes pour faire notre travail à
notre place. Cela parait simple dit comme cela.

L'inconvénient majeure de l'automatisation, c'est que écrire du code implique
immédiatement la création de bogue, de comportements innatendu. Mais cela
implique aussi qu'il faut maintenir ces programmes et les faire évoluer avec
l'entreprise.

Nous devons donc être prudent sur cette partie, et bien réflechir avant de se
lancer dans un chantier d'automatisation. Nous créons parfois plus de problème
que l'on en résout.

D'un autre côté, les avantages sont nombreux, le gain de temps à long terme est
indéniable et nous gagnons aussi beaucoup en fiabilité sur les tâches
automatisée. Les différentes action sont aussi plus rapide car nous n'hésitons
plus avant de lancer un script : Cela coûte du temps machine, peu cher,
contrairement au temps humain.

L'automatisation nous apporte aussi une plateforme neutre, indépendante des
machines sur lesquels les développeurs travaillent. On peut ainsi être sûr et
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

Un autre point important, c'est que ces métriques sont mise en place car nous
sommes en mesure de prendre des actions fasses à elle. Nous pouvons donc
automatiser certaines réponse.

L'exemple le plus courant est celui de **l'autoscaling**. Scaling en anglais
signifie « mettre à l'échelle ». Ici nous allons mesurer la charges sur nos
machines de productions afin, et si nous dépassons les seuils qu'on définit en
amont, on démarre automatiquement de nouvelles machine pour tenir la charge.
C'est ce qu'il se passe sur beaucoup de site de commerce les jours de grandes
affluence tel que le black friday ou les soldes.

Finissons ce sujets avec un dernier point d'attention. Imaginons que vous avez
mesurer la satisfaction de vos équipes via un formulaire que chaque membre doit
remplir à la fin de la semaine. Au bout de 3 semaines, votre indicateurs à
légérement baissé et vous décidez d'offrir des croissants pour toute l'équipe.
Deux semaines plus tard, le niveau rebaisse et vous achetez de nouveau des
croissants. Il est fort probable que suite à cela, les formulaires soit toujours
remplit négativement : vos équipes ont trouvé un moyen d'obtenir des croissants
et vous ne savez plus du tout où en est le niveau de satisfaction.

Bien que rigolo, cette situation est fréquente, restons vigilant fasse à nos
propre méthodes. Gardons à l'esprit qu'on peut toujours s'améliorer. Faites
l'effort de garder vos mécanisme **d'amélioration continue**.

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
