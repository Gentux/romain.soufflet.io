---
categories: kubernetes work infrastructure
custom_css: posts.css
date: 2018-12-12 15:51:00
img: "https://s3.eu-west-2.amazonaws.com/gentux/Images/DevObs.jpeg"
layout: post
excerpt_separator: <!--more-->
language: fr
public: yes
title: "5 minutes pour Kubernetes"
---

Tout le monde parle de *kubernetes*. Apparement, c'est trop génial et ça résout
plein de problémes de déploiement. Mais concrétement, la pluparts des
développeurs que je croise aujourd'hui me disent qu'ils ne connaissent pas
*kubernetes*, ce que ça offre (ou pas) et comment le mettre en place.

Sauf que voilà, on a pas tous 3 jours à investir dans l'étude d'un nouveau
produit, surtout avec la taille et la compléxité que représente *kubernetes*.

Alors on zap l'intro, on passe dans le vif du sujet et je présente *Kubernetes*
en 5 minutes !

<!--more-->

# C'est quoi K8S ?

On va faire simple, on est pressé. *Kubernetes* c'est long à écrire, alors
souvent on croise *K8S* qui utilise le même modéle que *i18n*, à savoir qu'il y
a 8 lettre entre *K* et le *S* dans le mote *Kubernetes* dont on peut l'écrire
*K8S*.

On abrège aussi souvent avec *Kube* à l'oral où sur des discussions.

Mais ça fait quoi tout ça, et bien on est sur un outil d'orchestration de
container. Qu'est-ce qu'un container ? [La réponse en 5 minutes !]()

L'orchestration, c'est un bien grand mot pour un concept assez simple. Prenons
un exemple, vous avez une application backend, un frontend et une base de
données. Chacun de ces composants sont dans containers, on va pouvoir décrire
notre déploiement comme:

 * Image du container *backend* en 2 exemplaires
 * Image du container *frontend* en 2 exemplaires
 * Image du container *BDD* en 2 exemplaires avec volumes de données persistent.

On donne la description à *K8S*, et lui il se débrouille pour faire apparaitre
tous ça sur les environnements de *qualification*, ou *production*, au bon
vouloir du développeur.

# Les points forts de K8S

C'est trop génial sur le papier, mais qu'est-ce que ça fait d'autre ? Parce que
cet exemple, j'ouvre 6 machines sur *AWS*, je passe 2 heures sur les
configurations et hop c'est plié.

On est pressé, alors voici une petite liste non-exhaustive :

 * On a mis 2 dans notre description, mais on aurait pu mettre 10 000 aussi
 * On peut ajouter des services en complétant la description
 * On peut versionner cette description avec le code source, c'est juste du
   texte
 * Si un des containers est cassé, on peut ajouter à notre description le
   comportement qu'il faut adopter pour reprendre l'activité
 * Pas besoin de gérer les régles de sécurité, ça fait partie du fichier de
   descriptions.

Bref, pour résumé un ensemble de possibilité qui grandit avec le produit (et il
grandi vite...) *K8S* gére pour vous toutes les questions d'infrastructure, afin
que vous puissiez vous concentrer uniquement sur votre application.

Tout ce dont vous avez à vous souciez, c'est de faire vos images de container
correctement afin qu'elles s'insérent dans l'environnement que vous procure
*K8S*

# Elle est où l'embrouille ?

Je me suis un peu emballé je pense, si c'est si génial que ça, pourquoi tout le
monde ne l'utilise pas déjà ?

Et bien pour la faire courte, *kubernetes* c'est dûr.

Niveau maturité, on commence à avoir un produit qui tourne plutôt bien, mais qui
n'est pas tout compris. Rien ne dit dans kubernetes comment on doit gérer les
stockage persistant par exemple. Si vous avez un réseau très particulier, il
faudra vous plonger dedans pour être sûr que ça se passe bien.

Si il vous faut votre propre déploiements de *K8S* dans votre entreprise,
préparez-vous à y laisser 2 ou 3 personne à temps plein pour le maintenir.
Sinon, prenez des prestataires ou des services *Kubernetes à la demande*.

# 5 minutes, c'est cours

Il y a tellement à dire sur *K8S*. C'est un vaste sujet qui mériterai des
dizaines d'articles. Mais c'est toujours difficile de prendre le temps de lire
tout ça.

Si vous avez des questions, j'ai ouvert un formulaire avec *typeforme*.
