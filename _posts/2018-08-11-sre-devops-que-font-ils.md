---
categories: work devops sre
custom_css: posts.css
date: 2018-08-11 16:38:25
img: https://s3.eu-west-2.amazonaws.com/gentux/Images/plan-maison-architecte-small.jpeg
layout: post
toporder: 1
excerpt_separator: <!--more-->
language: fr
public: yes
title: "Devops et SRE, De quoi s'agit-il ?"
---

Dans le [précédent
article](https://romain.soufflet.io/services/work/devops/sre/2018/05/15/deploiements-en-production-sre-devops-et-autres-sujets-obscurs.html)
je parle de la production et de ce que cela implique de s'en occuper.  Mais
quels rapports avec les termes **DevOps** et **SRE** ?


Je ne prétends pas pouvoir donner une définition claire et universelle pour ces
mots mais j'aimerais pouvoir les démystifier et en rendre la compréhension plus
accessible.

<!--more-->

Dans la plupart des projets informatiques, nous avons une équipe de
développeurs et une équipe d'administrateurs systèmes. Regrouper des unités
fonctionnelles est une construction naturelle que l’on retrouve dans la plupart
des entreprises. Il en va de même pour l'équipe comptable, l'équipe commerciale
et toutes les autres. Cependant cette séparation en différents pôles engendre
de nombreux problèmes de communication.

Les développeurs sont amenés à créer de nouvelles fonctionnalités, répercuter
les changements demandés par les clients dans l'application qu'ils construisent
et corriger les éventuelles erreurs remontées par les utilisateurs. Leur
mission est caractérisée par les évolutions du code source qu'ils écrivent, par
le changement et l’ajout de fonctionnalités.

Les administrateurs de leur côté sont en charge du maintien en conditions
opérationnelles. Chaque mise à jour peut mettre en danger l'intégrité des
produits et des services de l'entreprise. C'est pourquoi chaque changement doit
être appréhendé comme un potentiel risque. **Leur mission est donc la mise en
place et la gestion de la stabilité du produit**

Par définition, ces deux rôles sont amenés à être en conflit. D’un côté les
développeurs apportent du changement et de l’autre côté les administrateurs
cherchent à stabiliser les environnements de production.  C’est pourquoi les
deux rôles sont souvent opposés et que le dialogue est difficile entre ces
profils.

C'est dans ce contexte que naissent les notions **Devops** et **SRE**.  Ce sont
ces notions que je souhaite développer en parlant de ce qu'est **la culture
DevOps**, ainsi que du poste **SRE**.

## La culture DevOps

La culture DevOps se présente, dans un premier temps sur un plan
organisationnel. Il s'agit d'abolir les barrières entre les équipes de
développement et les équipes d'administrateurs. Le but étant de réconcilier des
missions ayant des objectifs différents: **Nous travaillons dans la même
entreprise, pour les mêmes clients, nous devrions le faire ensemble**.

En s'affranchissant de ces barrières, on permet aux développeurs et
administrateurs de communiquer et collaborer. On obtient ainsi des développeurs
qui prennent conscience de ce qu'est la production et comment on s'en occupe,
mais aussi des administrateurs capables d'automatiser leurs besoins en
maintenance et les mécanismes de mise en production.

La collaboration permet aussi de redéfinir comment l'application se construit.
On passe d'un modèle en deux étapes dans lequel des développeurs proposent un
paquet livrable et des administrateurs installent celui-ci tant bien que mal, à
une collaboration à tous les niveaux de conception.

En généralisant un peu, on arrive à un processus qui ressemblerait à ça:

![SRE
Workflow](https://s3.eu-west-2.amazonaws.com/gentux/Images/SRE+Workflow.png)

Et pour chacunes de ces étapes, les différents profils pourront s'entraider:

* Définir les tâches suite aux idées ou besoins émis par le client
* Développer / Exécuter cette tâche
* Revue de code et automatisation des tests sur une infrastructure la plus
  proche possible de ce que sera la plateforme de production
* Tester fonctionnellement, directement par le client si possible, sur un
  environnement clone de la production
* Automatiser le déploiement en production

On introduit de cette manière la notion de **pipeline** de production, celle-ci
étant à l'image des chaînes d'assemblage automobile. On peut parfois parler
**d'usine logicielle** pour désigner les chaînes telles que celles-ci.

Vient ensuite la mise en place de **l'amélioration continue**. Les équipes
techniques se réunissent autour d'une table et prennent le temps d'étudier
leurs propres manières de travailler. Elles identifient les passages douloureux
afin d'apporter les corrections leur permettant d'augmenter leur vitesse et
leur fiabilité.

En appliquant cette méthode régulièrement, on se laisse le temps de faire
évoluer les us et coutumes de l'entreprise progressivement, au rythme des
humains qui travaillent sur le projet.

C'est ainsi que l'on comprend l'une des notions clefs de l'implémentation de la
culture DevOps: ***tout le monde est DevOps et tout le monde travaille dans
l'intérêt de l'équipe***. Il y a donc une très forte composante humaine dans
l'équation.

## Différentes définitions et conflits

La question qu'on peut naturellement se poser est : « Comment mettre en place
cette culture DevOps dans mes équipes ? ». Je n'ai malheureusement pas de
réponse toute faite à cette question et suivant l'entreprise, les projets et
les équipes en place, les grandes étapes peuvent changer.

Il y a souvent une confusion entre **culture** et **profil** DevOps, créant
deux schémas récurrents dans le monde de l'entreprise actuel:

Un premier schéma où l’équipe de développeurs est renommée équipe DevOps: Ils
ont une liberté totale sur leurs déploiements mais n'ont plus de support
d'administrateurs systèmes pour les aider à s'occuper de la supervision, de la
sécurité, de la redondance des services et des autres sujets spécifiques aux
environnements de productions.

Un second schéma où l’équipe d'administrateurs est renommée DevOps: Ils gardent
les mêmes rôles et attributions mais on leur demande en plus d'automatiser
malgré le fait qu'ils n'ont pas forcément les compétences en développement ou
l'expérience pour le faire.

**DevOps est une culture**. On peut parler de mouvement, d'un ensemble de
bonnes pratiques à la limite mais pas d'une discipline en tant que telle. Ce
sont des facteurs humains qui me conduise à déployer des solutions techniques.

Il n’y a pas de consensus sur une définition claire et par conséquent personne
n'a la même. La plupart des offres d'emplois ou de missions portant le titre
DevOps ont du mal à définir leur besoin. Les entreprises recherchent donc des
profils très avancés techniquement sur une multitude de domaines et bien
entendu, le mouton à 5 pattes n’existant pas, ces offres ne sont pas pourvues.

De plus, lorsque le poste est pourvu il est très difficile pour un profil seul
de mettre en place tous les outils dont l'entreprise a besoin et même si les
outils sont installés et configurés, faut-il encore que les autres employés
s'en servent.

Par conséquent, répondre à la question « Comment mettre en place cette culture
dans mes équipes » reste une tâche très difficile. Pour bien comprendre les
actions à mettre en place, nous avons besoin de creuser encore un peu le sujet
**DevOps**.

C'est ici que l'on introduit la notion de **SRE**.

**SRE** et **DevOps** partagent les même principes fondateurs et beaucoup voit
**SRE** comme une implémentation spécifique du mouvement **DevOps** avec
quelques extensions.

Je compte tout de même écrire prochainement un article sur la reprise de projet
et l'implémentation de bonnes pratiques pour une transition vers une culture
**DevOps**.

## SRE: Site Reliability Engineer

**Ben Treynor,** le fondateur de l'équipe SRE chez Google, dit que c'est
lorsque l'on donne les tâches d'administration à une équipe de développeurs,
qu’émerge la notion de SRE.

Il est commun d'entendre que **SRE** est une implémentation concrète de la
culture **DevOps**.

Bonne nouvelle, on parle bien de profil **SRE** puisque le terme *Engineer* en
anglais fait référence à un ingénieur, donc une personne.

Commençons par discerner 5 piliers dans la culture **DevOps**:

* Faciliter la communication dans l'entreprise
* Accepter et banaliser les erreurs
* Appliquer des changements plus petits mais plus fréquents
* Automatiser les tâches les plus chronophages
* Relever tous les indicateurs qui pourraient être pertinents

Et pour chacun de ces points, nous verrons comment les profils **SRE**
l'implémentent.

### Faciliter la communication dans l'entreprise

Commençons par détailler l'aspect communication qui porte davantage sur
l'organisation que sur des problématiques techniques. Il s'agit ici, d'apporter
un véritable esprit d'équipe dans lequel on sensibilise chaque personne aux
enjeux auxquels nous devons faire face. J'en parle dans un [précèdent article
(en
anglais)](https://romain.soufflet.io/management/team/work/2017/03/14/re-organize-your-team)
mais aussi dans mon intervention [*Comment moderniser l'organisations de votre
équipe de
développement*](https://romain.soufflet.io/services/work/devops/sre/2017/07/04/moderniser-votre-equipe)

<iframe width="560" height="315"
src="https://www.youtube.com/embed/AS0v8oREpw8?rel=0" frameborder="0"
allow="autoplay; encrypted-media" allowfullscreen></iframe>

On oppose souvent les organisations en silos à la culture **DevOps**. Le silos
c'est un grand conteneur à grains opaque que l'on compare au fonctionnement des
équipes refermées sur elles-mêmes. À l'image de ces conteneurs, nous retrouvons
un fonctionnement opaque (manque de communication) et le moins de contacts
possible avec l'extérieur.

L'organisation en silos mène parfois à des situations gênantes ou deux équipes
peuvent travailler sur le même sujet sans en avoir conscience.  Cette
organisation peut également créer des situations dans lesquelles, une équipe
peut partir 6 mois sur un projet qui n'apporte que très peu de valeur à
l'entreprise.

Cependant détruire ces silos et rétablir la communication peut parfois être mal
vécu, n'oublions pas que les équipes sont constituées d'êtres humains qui ont
leur repaires et leurs habitudes. J'ai globalement pu observer que rétablir la
communication permet de faire naître une meilleure ambiance de travail et
économiser du temps mais cela passe forcément par une période transitoire qui
n'est pas toujours facile à vivre.

De plus, une fois que la communication revient, il faut rester vigilant afin de
maintenir ce niveau de communication. C'est un effort constant à fournir, au
risque de tomber de nouveau dans une organisations en silos.

Dans ce contexte, notre profil **SRE** saura mettre en place les outils
permettant aux équipes de communiquer. Que cela passe par des listes de
diffusions ou des feuilles de papier collées aux portes des autres bureaux.

L'incorporation d'une personne ayant une culture DevOps ou ayant le rôle SRE
est aussi une bonne occasion d'identifier les manques de communication entre
équipes.

### Accepter et banaliser les erreurs

Le deuxième aspect de l'approche **SRE** concerne la prise de risque et la
tolérance aux erreurs. C'est contre-intuitif pour une entreprise et par
conséquent l'un des points les plus difficile à mettre en place.

On va d'abord définir ce qu'est une erreur, et on va se mettre d'accord sur un
taux acceptable d'erreur, sur une marge de manœuvre. Dans notre cas, on parle
de taux de fiabilité sur l'environnement de production, il s'agit du
pourcentage de temps pendant lequel le service est en conditions
opérationnelles.

Pour le petit paragraphe mathématique, on va partir sur le nombre de secondes
dans une année. Et nous définissons avec les clients la durée qu'il est
acceptable de "perdre". À 100%, nous considérons que nous ne voulons pas une
seule seconde d'indisponibilité. À 99% nous serons indisponible 7,2 heures par
mois.

La logique est simple, maintenir un service à 100% demande des efforts
considérables, je pense même que cela est impossible pour la plupart des
entreprises. Alors que maintenir un service pour 99% du temps est relativement
simple. Quoi qu'il puisse arriver, nous disposons de 7 heures et 15 secondes
par mois pour réparer la production.

Google va encore plus loin dans cette approche et parle d'un crédit d'erreur
qu'il faut dépenser. Si l'équipe n'a pas eu assez de panne c'est qu'elle ne
prend pas assez de risques.

Sans aller jusqu'à faire un crédit pour casser la production, il est important
de rester réaliste. J'imagine que votre client voudra avoir 100% de temps de
production disponible mais l'effort technique pour atteindre cette objectif est
immense.

Dans l'approche **SRE** on distingue d'autres notions sur les niveaux de
services, si le sujet vous intéresse, il s'agit des notions de **SLA**, **SLO**
et **SLI**. Je ne détaillerai pas ces notions ici, les différences sont assez
subtiles. Par contre, j'aimerais préciser que j'ai donné ici des niveaux de
service entier, on peut avoir des décimales tel que 99.9% voire 99.9999%.

### Augmenter les fréquences des déploiements

J’ai souvent observé chez mes clients une réticence à la mise en production. Le
plus souvent cette peur est liée à des traumatismes de mise en production
précédentes échouant et entraînant plusieurs heures de casse tête pour les
équipes de développement et d’administration.

Dans la plupart des cas, cette peur est l’occasion d’ajouter des vérifications
et des procédures plus strictes pour chaque livraison. De cette manière, les
mises en production s’espacent dans le temps et chaque livraison comporte de
plus en plus de fonctionnalités.

Le piège se situe justement au niveau de la taille des livraisons : plus de
fonctionnalités à déployer, plus de problèmes potentiels lors de la livraison.
Et lorsque l’on rencontre de nouveaux problèmes, on implémente de nouveaux
process et de nouvelles vérifications et ainsi de suite.

Dans une approche **SRE** nous allons découper les évolutions pour toujours
avoir de petits incréments sur le produit en production, moins de nouvelles
fonctionnalités pour un périmètre mieux maîtrisé. On se reposera ici sur la
notion d'industrialisation que je décris dans [mon précédent
article](https://romain.soufflet.io/services/work/devops/sre/2018/05/15/deploiements-en-production-sre-devops-et-autres-sujets-obscurs.html).

Grâce à l'industrialisation, mettre en production peut devenir simple et
rapide. On en profite donc pour le faire plus souvent avec des améliorations
plus petites. Nous savons que notre version actuelle (appelée **N**) fonctionne
correctement. Nous pouvons donc déployer notre version suivante (appelée
**N+1**), voir si tout fonctionne, et re-déployer la version **N** si ça ne
fonctionne pas comme on le souhaite.

Nous avons parfois même un modèle inverse où une version **N+1** ne fonctionne
pas et lorsque l'on consulte les développeurs de l'application pour en
discuter, la bonne solution qui émerge est de déployer tout de suite la version
**N+2**.

Augmenter le nombre et la fréquence des mises à jour devient dès lors un gage
de stabilité. Mais il faut garder à l'esprit que ceci ne serait pas possible
sans la marge de manœuvre négociée en amont.

Reparlons aussi brièvement de l'aspect communication: que l’on veuille revenir
en arrière ou déployer une nouvelle version, l’opération se fera conjointement
entre les équipes de développement et les équipes de production.

On commence à voir les bénéfices du profil **SRE**.

### Automatisation

Un aspect des plus importants est l'automatisation. La plupart des équipes
**SRE** cultivent une vision utopiste de leur plateforme. Une vision dans
laquelle ils n'auraient plus de travail et pourraient rentrer chez eux alors
que la production fonctionne parfaitement.

Pour atteindre ce but, les équipes SRE ont recours à l'automatisation.  Cela
veut simplement dire qu’elles vont écrire des programmes pour travailler à leur
place. Cela parait simple dit comme cela.

L'inconvénient majeur de l'automatisation, c'est qu’écrire du code implique
immédiatement deux choses:

* La création de bugs, de comportements inattendus.
* La maintenance de ces programmes et le fait de les faire évoluer avec
  l'entreprise.

Il faut donc être prudents sur cette partie et bien réfléchir avant de se
lancer dans un chantier d'automatisation. Cela peut parfois créer plus de
problèmes qu’en résoudre.

D'un autre côté les avantages sont nombreux, le gain de temps à long terme est
indéniable et on gagne aussi en fiabilité sur les tâches automatisées. Les
différentes actions sont aussi plus rapides car on n'hésite plus avant de
lancer un script : cela coûte *du temps machine*, peu cher contrairement au
temps humain.

L'automatisation apporte aussi une plateforme neutre, indépendante des machines
sur lesquelles les développeurs travaillent. On peut ainsi être sûr et certain
que le programme fonctionne correctement quelque soit la machine qui l'exécute.
Et si on pousse ce raisonnement plus loin, on fera en sorte de créer nos
environnements de tests automatisés au plus proche de ce que sera
l'environnement de production final. On évite ainsi au maximum les erreurs qui
surviennent lorsque l'ont change des éléments entre l'environnement de
développement et l'environnement de production.

### Les indicateurs

La plupart des développeurs travaillent sur leur ordinateur personnel dans un
environnement maîtrisé. Dès lors que l’on change d’environnement (que ce soit
un environnement de qualification ou de production), nous ne sommes plus maître
de nos machines. Beaucoup d’entreprises aujourd’hui ont recours à des services
cloud tel que AWS (Amazon Web Services) ou GCE (Google Cloud Engine).

Dans ces environnements, plusieurs paramètres peuvent influer sur les machines
et impacter plus ou moins directement la production.

Énormément de choses peuvent mal tourner et afin de garantir que l’application
reste en ligne, il faut utiliser des sondes qui vont récolter des métriques. On
peut imaginer la sonde comme étant le thermomètre et la température comme la
métrique.

Tout comme pour l'automatisation, il faut rester vigilant et ne pas se laisser
entraîner par une campagne de récolte de métriques qui pourrait être inutile.

Pour qu'une sonde soit utile, il faut être en mesure de la comprendre et de
mener des actions face à la mesure. Ainsi, si votre mesure concerne la moyenne
des tailles de chaussures dans votre équipe et que votre activité concerne la
production de pot de yaourt, vous pourrez comprendre la mesure mais elle ne
sera pas pertinente pour votre prise de décisions. Par contre, mesurer le
nombre d'utilisateurs par minutes sur votre site en production peut vous
permettre de mener les actions qui permettront de tenir la charge.

Il faut donc rester le plus pragmatique possible et toujours se poser ces deux
questions pour chacune des métriques mise en place:

* Que signifie notre mesure ?
* Quelles actions pouvons nous mettre en place lorsque la mesure varie ?

Il faut aussi garder à l'esprit que nous pouvons mettre toute sorte de mesure
en place, ce n'est pas un domaine uniquement technique. Un autre exemple de
mesure qui a pu m'être utile par le passé est le nombre de déploiement par
semaine : lorsque l'indicateur à commencé à baisser, nous avons identifié une
difficulté croissante dans la création des nouvelles fonctionnalités et nous
avons donc pu acter qu'il nous fallait refaire un travail de fond sur notre
base de code pour améliorer la situation.

Vos métriques peuvent être soit de nature organisationnelle soit porter sur le
développement des nouvelles fonctionnalités, sur le nombre de tickets ouverts
ou simplement sur la production qui tourne actuellement.

La mise en place de ces métriques permet de mener des actions face à elles.
Nous pouvons donc automatiser certaines réponses.

L'exemple le plus courant est celui de **l'autoscaling**. Scaling en anglais
signifie « mettre à l'échelle ». Ici il s'agit de mesurer la charge sur les
machines de productions afin que si l'on dépasse les seuils définis en amont,
on puisse démarrer automatiquement de nouvelles machines pour tenir la charge.
C'est ce qu'il se passe sur beaucoup de site de commerce les jours de fortes
affluences tel que le *black friday* ou les soldes.

Finissons ce sujet avec un dernier point d'attention. Imaginons que vous avez à
mesurer la satisfaction de vos équipes via un formulaire que chaque membre doit
remplir à la fin de la semaine. Au bout de 3 semaines, votre indicateur à
légèrement baissé et vous décidez d'offrir des croissants pour toute l'équipe.
Deux semaines plus tard, le niveau baisse à nouveau et vous achetez de nouveau
des croissants. Il est fort probable que suite à cela, les formulaires soient
toujours remplis négativement : vos équipes ont trouvé un moyen d'obtenir des
croissants et vous ne savez plus du tout où en est le niveau de satisfaction.

Bien qu’amusante cette situation reste fréquente, il faut alors rester vigilant
face à nos propres méthodes. Il faut garder à l'esprit que l'on peut toujours
s'améliorer. Faites l'effort de garder vos mécanismes **d'amélioration
continue**.

## Conclusion : À quoi ressemble donc une entreprise avec du **SRE**

Je ne vais pas mentir, intégrer tous ces aspects dans la vie de votre
entreprise n'est pas chose aisée. Mais rêvons un peu et imaginons que c'est le
cas, à quoi ressemble votre quotidien désormais ?

Les développeurs, les profils **SRE** et les administrateurs travaillent main
dans la main. Ça ne veut pas dire qu'ils sont toujours d'accord mais ils
discutent autour de leurs différences et contraintes et trouvent de meilleures
solutions.

La créativité de vos équipes augmente, de nouvelles idées émergent et peuvent
être testées car les développeurs n'ont plus peur de demander plus de
ressources sur les différents environnements de tests et même de productions.
Les administrateurs quant à eux, osent demander des ajustements particuliers
aux développeurs afin d'avoir une architecture plus stable et pérenne.

Mais le point le plus important, c'est l'accélération du cycle de valeur de
votre entreprise. Le passage de l'idée à la mise en production est plus fiable
et plus rapide. On passe de l'idée à la conception puis la réalisation, les
tests, la validation et la mise en production en un temps record et en
respectant chaque rôle dans la chaîne.

Bien que tout ne soit jamais parfait, le cadre de travail obtenu de la sorte
est plus agréable à vivre et pourrait même avoir des effet bénéfique sur les
aspects recrutements.

## Prochainement

Je prévois d'écrire un article sur les architectures immutables ainsi qu'un
article sur la transition d'une équipe « classique » vers un modèle plus proche
d’un **SRE**.

Cependant, l'écriture me prenant beaucoup de temps, je ne pourrais m'occuper
que d'un article à la fois, n'hésitez pas à me dire ce que vous en pensez dans
les commentaires, par mail, sur twitter ou linkedin :)
