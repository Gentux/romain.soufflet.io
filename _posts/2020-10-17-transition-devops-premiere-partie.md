---
categories: article devops
custom_css: posts.css
date: 2020-10-16 11:16:32
img: "https://gentux.s3.eu-west-2.amazonaws.com/Images/erreur-a-evite-small.png"
layout: post
toporder: 2
comments: true
excerpt_separator: <!--more-->
language: fr
public: yes
title: "Transition Devops (1er partie) : Les erreurs à éviter"
---

De nos jours, le modèle “Devops” attire de plus en plus mais se conçoit à
travers de nombreux changements. Le fait de vouloir intégrer rapidement de tels
changements peut se solder par des échecs et une frustration décourageante.

<!--more-->

Cet article est un moyen d’expliquer quelles peuvent être les difficultés
rencontrées à travers une telle démarche. Il s’agirait de pouvoir identifier
pour quelles raisons se créer de telles difficultés, comment faire pour les
éviter et intégrer plus simplement un modèle Devops.

Il existe trois problèmes principaux qui pourraient expliquer le fort taux
d'échec d’une transition “devops” :

* La volonté de se transformer, d’évoluer vers un modèle “devops” mais sans
  rien changer dans son organisation
* Le fait de demander à une équipe de se débrouiller seule pour « faire du
  devops »
* Le manque d’objectifs mesurables et concrets

## Se transformer sans rien changer

De nombreux articles vantent les mérites de la culture “devops” et les bonnes
pratiques qui en découlent. Pour autant vous n’y trouverez pas de plan d’action
concret et réalisable pour intégrer cette culture “devops”.

Même si le CEO ou CTO peut avoir une vision claire de ce qu’il aimerait obtenir
après transformation, c’est la transmission aux différents profils de
l'entreprise qui s'avère être le point le plus complexe et le plus
problématique.

Cette différence de point de vue entre la direction et le reste de l’entreprise
est le point de départ de nombreux problèmes. Ces problèmes peuvent prendre
différentes formes et apparaissent généralement avec le schéma suivant:

* Le CEO/CTO produit une demande pour faire davantage de **Devops**
* Le manque d’information sur les actions précises à entreprendre se solde par
  la création d’un **pôle devops**
* L'entreprise poursuit son fonctionnement traditionnel sans **rien changer à ses
  pratiques**

L'effet pervers que dessine ce schéma est que cette nouvelle unité **Devops**
n'a pas la possibilité de faire ses preuves. L'entreprise continue de
fonctionner de la même manière sans prendre en compte les changements qu’un
pôle **Devops** pourrait suggérer. Les personnes et les compétences qui
composent ce nouveau pôle ne sont pas mises en avant, voir même ignorées. Dans
ce cas il n’y a pas d’intégration à proprement parler.

Prenons l’exemple suivant: une nouvelle unité Devops a mis en place un
**pipeline d’intégration continue**. Dans le schéma décrit précédemment, cette
unité a travaillé en autonomie sur ce sujet et cela sans la participation des
équipes qui devront se servir dudit sujet.

Dans ce cas le résultat est toujours le même: les équipes qui se verront
imposer ce nouveau pipeline devront modifier leurs habitudes, elles devront
s’adapter à ce nouveau système. Le problème principal n’est pas la qualité du
nouveau service, la vraie source de frustration pour ses équipes, c’est le
manque d’informations. Sans informations préalables sur le changement et
travaillant avec un ancien modèle qui, sans être parfait est souvent
fonctionnel, les équipes ne comprennent pas ce qu’elles considèrent comme un
changement sans fondements apportant davantage de contraintes sans résoudre de
problèmes apparents.

Pour ces équipes déjà en place, la transition DevOps se pose donc comme une
contrainte, un élément perturbateur dans leur travail.

Pour régler ces problèmes, chaque équipe qui sera impactée par les changements
liés à la transition Devops devra faire partie du processus global. Sans cela,
toute nouvelle initiative sera jugée comme inappropriée et mettra en danger la
cohérence globale du projet. L’intégration de la culture **Devops** doit se faire
en douceur en prenant en compte les individus si l’on ne veut pas créer un
chaos nuisible pour l’entreprise. Il s’agit ici de ne pas “brusquer” les
composantes de l’entreprise en leurs imposants des processus qu’elles ne
comprennent pas et dont elles n’ont aucunes connaissances préalables.

## Les équipes « Devops »

Les nouvelles entités Devops ou les anciennes à qui l'on demande de “faire du
Devops” sont aussi dans une position délicate : elles ne savent pas quoi
faire pour être “davantage devops”.

La conséquence directe de ce flou derrière le terme Devops se traduit par une
incompréhension de la part des équipes qui doivent devenir devops sans
comprendre ce que cela sous entend et comment le faire.

Les notions **Devops** étant assez nouvelles dans le monde de l’entreprise et
sujettes à différentes interprétations, il devient dès lors complexe d’aligner
les visions de tous derrière celles-ci.

Si la définition précise du Devops et de la culture qui en découle vous
intéresse, j’ai [écris un
article](https://romain.soufflet.io/work/devops/sre/2018/08/11/sre-devops-que-font-ils)
qui pourra vous permettre de mieux intégrer ces notions plurielles.

Même en ayant une définition commune, les équipes ne peuvent pas s’en sortir
seules puisque le point principal de la culture Devops se base sur la
communication et l’entraide.

C’est pour cette raison que les initiatives demandant à une seule équipe de «
faire plus de devops » sont vouées à l’échec. Comment une équipe seule pourrait
permettre à toute l’entreprise de mieux communiquer et améliorer les relais de
travaux ?

Chaque équipe doit être impliquée dans cette transition, chaque équipe doit
pouvoir y voir son propre bénéfice dans les changements de l’entreprise. Ce
n’est qu’en voyant ces bénéfices que les équipes voudront y participer.

La culture devops nous apporte aussi plus de vitesse dans les déploiements.
Cette vitesse s’exprime à travers l’automatisation de certains process.
Certaines personnes le vivront comme une opportunité de créer de nouveaux
outils, d’autres y verront la menace d’être remplacés par ces scripts et de
perdre leurs emplois.

Il est illusoire d’imaginer que l’ensemble du processus de déploiement sera
automatisé. Il est tout autant illusoire de s’imaginer que l'on aura plus
besoin de nos employés une fois la transition entamée. Malgré tout, cela reste
une peur très présente dans l’entreprise.

Les outils et pratiques devops rencontreront donc une forte résistance sur le
plan humain et organisationnel. Tous les nouveaux développements ont des bugs,
c’est un effet que l’on ne peut éviter. En plus des problèmes déjà évoqués, ces
nouveaux bugs seront autant de nouveaux arguments pour les anti-devops.

Il est donc important dans chaque transition devops de surveiller les réactions
de chaque équipe comme le lait sur le feu. L’idée selon laquelle la culture
Devops serait néfaste et contre-productive peut se répandre très vite et il
vous sera alors encore plus difficile de persévérer dans cette direction sans
soutien.

## La vision et les objectifs du changement

Toute transformation implique un état initial et un état final. Prenons un
instant pour y réfléchir :

* Un état initial dans lequel votre entreprise fonctionne mais pas de manière
  optimale, vous aimeriez y apporter des améliorations notamment à travers la
  culture **Devops**
* Un état final, idéal, dans lequel les points d’améliorations sont des acquis

Il est donc primordial de se poser la question suivante pour aligner tout le
monde sur la transition : Que veut on changer dans notre organisation ?

Quand il s’agit d’augmenter le nombre de déploiements par exemple, les
questions qui suivent seront “combien en faisons-nous actuellement ?” et
“combien souhaitons-nous en faire à l’avenir ?”.

Dans le même raisonnement, il est aussi important de définir ce que l’on
souhaite garder. Il est, par exemple, courant de voir une étape de validation
humaine avant les passages en production. Puisque passer de 4 déploiements par
an à 4 déploiements par mois ne changera pas le besoin de validation humaine,
les équipes devront prendre en compte ce nouveau rythme dans leur emploi du
temps et dans leur gestion quotidienne. Ce sont des éléments à discuter avant
d’entreprendre les changements.

De manière implicite et parce que cela fait aussi partie de la culture devops,
il est nécessaire de pouvoir mesurer les objectifs. Dans l’exemple précédent,
la mesure de l’objectif et de la performance est évidente mais si votre
objectif est une meilleure communication cela sera beaucoup plus compliqué de
trouver les bons indicateurs et les bons objectifs.

Ce point est particulièrement important car cela fait partie des éléments
derrière lesquels les équipes pourront se concentrer et réfléchir ensemble. Les
objectifs seront donc un moteur de transition devops, une façon d’introduire du
travail d’équipe entre équipes.

## Conclusion

Même s'il existait la possibilité dès aujourd’hui de créer le plan parfait qui
corresponde totalement à votre organisation, l’application de ce dernier
restera difficile. J’ai pris l’habitude de dire à mes clients et collaborateurs
que les problèmes les plus importants sont rarement techniques, ce sont
davantage des problèmes humains.

Tout changement rencontrera de la résistance. Il y aura des profils qui auront
peur de perdre leur emploi. Certains seront très heureux de changer d’équipe,
d’autres se sentiront contraints de partir. Les difficultés humaines liées au
changement doivent être le centre d’attention principal de toute transformation
dans une entreprise.

J’aborderai la **transition devops** de manière plus concrète dans la deuxième
partie de cet article. Dans le but de vous donner les clefs pour mener ces
changements avec succé.
