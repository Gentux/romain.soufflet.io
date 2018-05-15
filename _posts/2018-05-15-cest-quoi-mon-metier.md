---
categories: services work mep
custom_css: posts.css
date: 2018-05-15 11:16:32
img: https://s3.eu-west-2.amazonaws.com/gentux/Images/raspberrypi_network.jpg
layout: post
title: C'est quoi mon travail exactement ?
---

On me demande souvent ce que je fais dans la vie. Et il m'est très difficile de
répondre.

Pas tellement parce que mon travail est flou, mais parce qu'il repose sur des
concepts que la plupart des gens ne maitrisent pas. La manière la moins
technique que j'ai d'expliquer de quoi il s'agit est la phrase suivante :

« je m'occupe de la mise en production »

Certes, mais c'est quoi une « production » ? Ce n'est pas une notion compliquée,
mais c'est une notion qui reposent sur plein d'autres concepts et qui rendent
son explication assez ardu.

J'en ai aussi beaucoup parler aux développeurs que je rencontre et je me suis
aperçu que peu de développeur s'intéressent à mon domaine d'expertise. Ce n'est
simplement pas leur métier.

Pour aller plus loin, je m'occupe de la production, au sens large. Et cela
inclut les domaines suivant:

* L'architecture de la solution
* Le passage en production (pipeline de développement)
* Le Maintiens en conditions opérationnel (MCO)
* La sécurité
* Faire face à l'imprévu, évaluer les risques (connu sous le nom
  « Disaster Recovery »)

Et chacun de ses domaines mérite son propre livre pour en expliquer les tenant
et aboutissant. Chacune de ses notions repose elle-même sur d'autres notions
plus techniques.

On va essayer de survoler tout ça dans cet article.

## L'architecture

Ok, ça peut paraitre simple. Bah en fait, non.

Mais pour cela reste accessible, je vais prendre un exemple simple : un service
de localisation de restaurant.


Pour se faire, l'entreprise devra développer plusieurs choses:

* Une base de donnée pour y stocker les adresses et les spécifité de chaques
  restaurants
* Un backend, le cœur de l'application qui permettra de faire des recherches,
  d'enregistrer de nouveaux restaurant… etc.
* Un frontend, pour que les utilisateurs aient une bonne expérience de
  l'application.

L'architecture, c'est la partie du travail qui va nous permettre de dessiner le
schéma suivant :

À faire: inclure le schéma

Et on voit que pour cette toute petite application (qui ne peut que grossir), il
nous faut déjà 7 machines, configurer les couches réseaux et prévoir tout un tas
de cas plus improbable les uns que les autres.

Mais cela reste un exemple très simple, il est assez fréquent de se retrouver
face à une vingtaine de services répartie sur 30 à 40 machines.

Bien évidemment, toutes les entreprises ne mettent pas en place tout ce bazard
dès la première ligne de code. Il faut faire des arbitrages et savoir ce qui est
important pour que le service soit correctement rendu à l'utilisateur final.
Mais en regardant le schéma, j'ai une bonne douzaine d'idée pour compléter cette
architecture.

C'est donc la première partie de mon travail, réflechir au système dans sa
globalité, et voir les faiblesses et les forces de la solution.


## L'industrialisation (Le passage en production)

Sauf que voilà, une fois qu'on a notre schéma d'architecture, qu'on a 30
machines qui font tourner 20 services différents... comment est-ce qu'on
maintient tout ça ? Comment le fait-on évoluer ?

Les premières réponses, plus simple du point de vue de n'importe quel profil
technique : Se connecter aux machines pour les configurer correctement.

C'est une manière de faire que je croise très souvent dans les entreprises, et
malheureusement, ce n'est pas la bonne solution.

Se connecter aux machines pour les configurer à la main, on arrive sur des
configurations en flocons de neige (snowflakes en anglais). Parce que comme c'est
fait à la main, même si on désire que toutes nos machines soit configurer de
manière similaire, il y a toujours de petites différences entre chaque.

Toutes les machines sont les mêmes, mais pas tout à fait #SameButDifferent

https://media.giphy.com/media/C6JQPEUsZUyVq/giphy.gif

Et les conséquences sont désastreuses : mettre en production est un enfer dans
ces conditions. Chaque machine doit avoir un traitement différent, la mise en
production peut donc prendre des jours, et on est jamais certain du résultat.

L'industrialisation est donc la deuxième partie de mon travail, et je dirai la
plus importante. Il s'agit d'un processus finalement assez long, qui demande un
investissement aussi bien en durée que en moyen. De plus, la plus-value n'est
pas immédiate et c'est donc malheureusement pas le premier souci des dirigeants
non technique.

En industrialisant, on automatise la création des *image*. Parce que oui, se
connecter aux machines pour les mettre à jour comportent des risques, donc on
crée plutôt des images. Mais j'en reparlerai dans un autre article dédié.

Ensuite, on automatise le remplacement des vieilles machines par de nouvelles,
afin d'assurer un passage en production en douceur, avec le moins d'intéruption
de service possible.

Et cela va surtout permettre d'appuyer sur le bouton « mise en prod » l'esprit
tranquille.


L'idée principale derrière l'industrialisation, c'est de créer une chaine de
production qui permet à l'entreprise de:

* Livrer plus rapidement ses clients
* Fiabiliser les livraisons
* Banaliser la livraison (plus fréquent, plus rapide)
* Pouvoir valider ou invalider plus rapidement les nouvelles fonctionalités

Même si parfois, cela paraît compliqué. Je n'ai encore jamais vu d'entreprise
regrettant d'avoir investi sur l'industrialisation de leur plate-forme.

Par contre, la majorité des cas que je rencontre, l'entreprise n'est pas au
courant qu'elle pourrait investir dans un projet d'industrialisation de leur
mise en production.


## MCO: Maintien en conditions opérationnelles

Mettre en production, c'est bien beau, mais la vie ne s'arrête pas là. Malgré
plusieurs années à m'occuper de différentes plateformes logiciel, je suis toujours
stupéfait par la quantité de choses qui peuvent mal tourner, même en production.

Or, une fois l'application en production, il faut maintenir celle-ci en état de
marche. Une production à l'arrêt, c'est une perte séche pour l'entreprise.

On parle donc de Maintiens en Conditions Opérationnel. C'est un joli nom, mais
incorrecte selon moi.


En réalité, on ne peut pas vraiment garantir de rester en conditions
opérationnelles. Ce rôle-là, c'est plutôt l'architecture qui nous le fournit.

Cependant, ce qu'on peut faire, c'est de récupérer un état opérationnel, dès
lors qu'une alerte est levée. Lorsqu'une machine tombe, si l'architecture est
solide, le service restera disponnible, mais en mode dégradé.

Le mode dégradé, c'est pas terrible, mais c'est mieux que de ne plus avoir de
service. Le but, c'est de retrouver un état complétement opérationnel.

La bonne nouvelle, c'est qu'en industrialisant la mise en production, remettre
de nouvelles machines pour remplacer celles qui sont cassées, c'est facile, et ça va
vite. Cependant, il faut avoir l'information que quelque chose va mal pour
lancer ces actions.


Voici donc le 3éme aspect de mon travail, souvent appelé **monitoring** et
**supervision**. Il s'agit de mettre en place des outils pour recevoir des
alertes si quelques choses tourne mal sur notre système.

Mais si on y réflechit une petite minutes, on peut aller plus loin que «
recevoir une alerte », on peut automatiser la réparation:

* On écarte la machine malade (on la garde pour comprendre l'erreur)
* On redémarre une nouvelle machine neuve qui fonctionne
* On cable le réseau
* On relance les vérifications

Alors oui, j'ai pas parlé des **vérifications**, ce sera pour un prochain
article.

C'est assez difficile d'automatiser cette partie, mais si l'industrialisation
s'est bien passé, il n'y a pas de raison pour que la partie **MCO** ne se passe
pas bien.


## Securité

Bon, quand on arrive là, que notre produit se déploit de manière industrielle et
qu'il s'auto-répare en cas de problème, on commence à être bien.

Mais il reste des aspects dont je n'ai pas parlé. C'est difficile pour moi de
faire une section à part pour parler de la sécurité, car il ne s'agit pas d'un
projet qu'on peut ajouter, il n'y a pas de crême magique pour sécuriser ce qui
existe déjà.

La sécurité, on doit l'avoir à l'esprit dans **toute** les étapes précédentes.
On doit toujours avoir un œil sur cet aspect-là.

Du développeur à la production, tout doit être fait pour que les données
importantes soient protégées, chiffré et imperméabiliser.

Pour cela, on a plusieurs outils qu'on peut utiliser pour essayer de s'en tirer.

Tout d'abord, le chiffrement des données. C'est un sujet un peu technique, alors
je vais laisser ce merveilleux article vous expliquer de quoi il s'agit :

https://medium.freecodecamp.org/https-explained-with-carrier-pigeons-7029d2193351


Ensuite, quelque chose de très important que peu d'entreprise mette en place,
c'est la procédure d'embauche et la procédure de départ: Lorsqu'un nouveau
collégue arrive, comment lui donne-t-on accés à l'ensemble des outils ? Comment
fait-on lorsqu'il quitte l'entreprise ?

De nombreuse faille de sécurité découle de cette partie.


Et un troisième aspect sécurité serait les mises à jour **fréquentes** des outils
qu'on utilise. L'avantage, c'est qu'industrialiser la mise en production nous
permet d'appliquer les mise à jour plus souvent et d'être moins vulnérable.


Cependant, le probléme de la sécurité en informatique, c'est qu'elle est très
illusoire. On ne pourra jamais être vraiment sûr de sa propre sécurité. Tout ce
qu'on peut faire, c'est diminuer les risques.

Pour ma part, c'est un aspect important de mon travail, mais ça constitue pas un
aspect supplémentaire de mes services, c'est livré au travers des services que
je propose déjà.


## Survivre aux cataclysmes

Jusque-là, je vous ai parlé de ce qu'on peut mettre en place pour avoir une
production qui tiens la route. Et c'est ainsi qu'on en arrive au dernier aspect
de mon travail, **disaster recovery**, ou l'art de survivre à l'apocalypse.

Bon, OK, en cas de chutte de métorite qui mettrait fin à l'humanité, votre
production sera peut-être le cadet de vos soucis. Mais quand une peleteuse
arrache les fibres optiques de votre datacenter... bah il n'y aura plus de
production... même si elle continue de fonctionner dans le datacenter.

Concrétement, surmonté ce genre de choses, si on a correctement industrialisé
les mises en prod, on pourra refaire une production ailleurs. Cependant, ça
prendra du temps.

Le but ici, c'est de rester proactif, prévoir les pires cas imaginables, et
prendre conscience de la probabilité de ce genre d'évennement. Perdre un
datacenter, ça n'arrive pas tous les jours, mais malheureusement, c'est
suffisament fréquent pour que j'en subisse environ 1 par ans. Je ne compte pas
ceux dont j'entends parler mais qui ne m'affecte pas.

Il n'y a pas grand choses à faire quand les infrastructures elle-même casse sous
vos pieds, aussi solide que soit votre installation, vous en serez victime.

Mais plutôt que de baisser les bras et prier pour que cela ne se produise pas ou
se produise peu, nous pouvons nous y préparer :

* Imaginer les catastrophes potentielles
* Évaluer le risques de chacune
* Évaluer l'impact potentiel sur votre production
* Se préparer à l'impact

Ces évennements douloureux sont théoriquement rares, mais croyez-moi, ça arrive,
et plus souvent qu'on le pense. S'y préparer, c'est un peu comme suivre une
formation aux premiers secours, dans le fond, on espére ne jamais avoir à s'en
servir, mais quand on en a besoin, on est heureux d'avoir fait l'effort de
suivre ces cours.


## Conclusion

Je me suis récemment rendu compte que tout cet univers de compétences était
complétement étrangers aux personnes que je rencontre. Ils continuent de me
demander, même après plusieurs années, « Mais concrétement, c'est quoi ton
travail ? ».

Et je pense avoir fait un rapide tour de mon travail ici, éclairci quelques
notions sur lesquelles je travaille.

Comme je le disais au début, expliquer ce que je fais est un petit challenge en
soi. Rencontrer quelqu'un, ne pas connaître ses affinités avec le monde
informatique et leur expliquer mon travail est aujourd'hui une vraie douleur.

Chacun des points que j'ai évoqués dans cet article pourraient être l'objet
d'autres articles, sans compter les notions que je n'ai pas abordés tel que la
culture **DevOps**,  **méthodologies** que nous mettons en place avec les
équipes de développement ou encore.

J'espére que suite à cet article, vous aurez une meilleure vision de ce que
peut être un site internet ou une application mobile. J'espére aussi ne pas
avoir été trop technique et ne pas avoir perdu 95% des lecteurs en cours de
route.

Je vais sans doute écrire d'autres article dans ce style, pour éclaircir les
notions sur les lesquelles nous travaillons tous les jours.

À bientôt,
