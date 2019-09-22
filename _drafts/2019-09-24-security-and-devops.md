---
categories: devops sre security
custom_css: posts.css
date: 2019-09-24 13:04:45
img: https://upload.wikimedia.org/wikipedia/commons/3/32/Lego_Color_Bricks.jpg
layout: post
excerpt_separator: <!--more-->
lang: fr
public: no
title: "Devops et Sécurité"
---

La philosophie Devops n'a pas fini de nous étonner. Alors que beaucoup
cantonnent cela aux domaines techniques je suis réguliérement aspiré par des
problèmatiques transversent et parfois abstraites.

Aujourd'hui, j'aimerai parler d'un théme récurrent et indispensable pour tout
système d'information : La sécurité.

<!--more-->

Attention je ne compte pas être exhaustif dasn cet article, je veux juste
transmettre les clefs pour que vous compreniez les enjeux du sujets.

Le maitre mot dans ce genre de théme, c'est le *pragmatisme*. Il faut savoir
rester réaliste quand à vos exigences et savoir être créatif pour proposer des
solution.


## De quoi parle-t-on concrétement (a.k.a tl;dr)

J'ai croisé des réferrents sécurité, parfois des équipes sécurité. De temps en
temps ce sont juste des réunions sécurité. Peu importe la forme, il faut avant
tout garder un esprit bienveillant : La sécurité est un sujet utile et
important.

En tant qu'ingénieur, il est beaucoup plus facile de classer une recommandation
de sécurité comme inaproprié plutôt de que de remettre en cause un design qui
nous parait élégant. Cependant, gardons à l'esprit que ces recommandations sont
faite pour le bien de l'entreprise.

De plus, le domaine sécurité souffre énormement de sa propre nature : il est
impossible d'associer un ROI (Retour Sur Investissement) à cette section.

Travailler la sécurité ne garantie pas que nous n'auront pas de problème, et ne
rien faire et prier reste une solution bien trop souvent exploiter par les
entreprises.


## Mini audit maison sans consultant spécialisé

J'entends parler des *audit* depuis le premier jour de mes études post-bac,
cependant il m'a fallut quelques temps pour bien comprendre de quoi il s'agit.

Quand une entreprise demande un audit sur ces process on pourrait faire le
parallèle avec une enquête interne pour mieux comprendre le fonctionnement de
l'entreprise. La finalité est souvent rendu sous formes de documents PDF
accompagné d'une joli présentation par l'équipe qui réalise l'audit.

L'audit de sécurité est communs dans les projets informatiques. Souvent il coûte
cher, prend du temps et reste un passage obligatoire.

Dans ce documents seront définit les notions de risques et de menaces. Les
termes peuvent changer mais l'idée reste la même.

Prenons un exemple : Un dégat des eau.

Par économie, l'entreprise à installer les serveurs chez Mémé, son appartement
en plein cœur de paris nous offres une connexions stable et rapide tandis que
ses oreilles vieillissantes ne sont pas dérangées par le bruit de notre baie de
server.

Sauf que voilà, immeuble parisien, les dégats des eaux sont fréquent. La
menace est identifié, et le niveau de risque reste élevé car ce problème est
fort probable.


Et aprés ? À quoi cela sert-il ? C'est là que le domaine *sécurité* est
particulier, l'audit en lui-même n'a pas de valeur. Ce qui est important c'est
ce que l'entreprise fera avec.

Si l'on reprend notre exemple, la décisions logique sera de migrer nos server
dans un bâtiment prévu à cet effet. Cependant, cela engendre un coût financier
et un arbitrage en fonction de l'entreprise.


Les notions de risques et de menaces sont centrales dans un audit de sécurité,
mais je laisse ce travail à d'autre. En tant que défenseurs de l'idéologie
DevOps, mon rôle et de préparer l'entreprise à cet audit et de mettre en place
des mesures concréte.


## Mesure concréte #1 : Survivre à l'apocalypse

Le but d'un audit c'est d'identifier les menaces et leurs niveaus de risques.
Autrement dis avec mes propres mots : s'assurer que rien n'empêchera la
production de tourner.

Beaucoup de scénario d'attaque sont possible, et il y n'y a pas que ceux qui
figure dans l'audit. Il y a des failles dans tout les logiciels que nous
utilisons, des risques dans tout les bâtiments que nous construisons. Se couvrir
de toute les possibilités est impossible.

Par conséquent, on reste pragmatique et on envisage le pire.

Premier scnénario à évoquer est la perte pur et simple de l'environnement. La
menace est critique, le risque est élevés. Aprés plusieurs années à travailler
dans ce domaines, je continue de m'étonner à voir que nos environnement sont si
fragile.

---

J'ai déjà écrit sur ce point dans l'article sur les [DevOps et SRE](url ici).
Alors tant pis si je me répète, c'est important : Redéployez souvent. C'est
l'un des pilliers du travail d'industrialisation dans la culture DevOps. Êtres
capable de tout redéployer en partant de zero permet de s'assurer que peu
importe le danger auxquel nous faisons face, nous pourrons y remédier.

Un petit bémole cependant est de savoir jusqu'où vous prévoyez de vous protéger.
Par exemple, si je prend un cas fréquent où l'entreprise est hébergé par AWS, si
jamais c'est AWS qui tombe est n'est plus disponible, est-ce que nous prévoyons
un plan de secour chez GCP ? C'est une question à laquelle chaque entreprise
doit répondre en fonction de sa situation. Un tel plan coûtera cher, et le
niveau de risques assez faible.

## Mesure concréte #2 : Reconstruire après l'apocalypse

La seconde partie la plus importante dans votre environnement de production est
la partie *data*. La pluparts des services actuelles n'ont plus aucune utilité
sans leurs données.

Et encore une fois, si on regardes la menaces et le niveau de risques, c'est un
sujet important qui *doit* être traiter. Cela m'étonne de voir de nombreuse
entreprise pour qui ce sujet est toujours un sujet à débàt. Je ne vais pas y
aller par 4 chemins, ce sujet est suffisament traiter et documenté. Je vais
abstraire et simplifié en 4 niveau.

Niveau 1 : Le disque local. Même sur un orchestrateur de container comme
Kubernetes qui traite des *volumes*, derrière le volumes se cache un disque dur
sur la machines qui execute votre container. Il faut toujours considérer que
cette forme de stockage est volatile est peu fiable. Cela reste le stockage le
plus important de votre production puisque c'est celui qui est utilisé en
premier lieu par les clients.

Niveau 2 : Réplication du premier niveau. Ce deuxième disque est souvent
identique au premier, mais c'est un deuxième disque. Dans les environnements
*scalable* on va parler de stratégie de réplications car il ne sera pas
néscessaire d'avoir toutes les données sur tout les disques. Il est aussi
probable que vous ayez accés à des solutions techniques tel que Ceph pour gérer
cette réplication de données.

Niveau 3 : Backup. On en arrive au niveau *backup*.

Niveau 4 : La sauvegarde à froid.

## Mesure concréte #3 : Comprendre et Corriger

les métriques, analyse post-mortem
Maintenant qu'on s'est rétablie

## Mesure concréte #4 : Prévention de l'apocalypse

Les actions qui nous permettent "facilement" de passer au travers

* Préventions de l'apocalypse
* Mises à jour de sécurité
* Gestion des acréditations
* Disponibilité RH
* Chiffrement

## Et plein d'autres menaces

J'ai beaucoup parlé des menaces techniques car je garde un point de vue
d'ingénieur. Mais gardons à l'esprit que les menaces peuvent prendre bien
d'autres formes.

J'ai déjà parlé d'un problème RH, si l'équipe disparaît que faisons nous ? Mais
parfois dans de grandes structure, une décision du patron suffit à faire
disparaitre un projet entier, on terminer un contrat avec un prestataire.

Les poursuites judiciaire sont aussi une menace, il y a même une économie
identifié sur ce genre de choses appelé *patent troll*

J'ai encore un exemple de menace sortie de nul part. Lors d'une mission pour une
trés grandes structures, nous travaillons avec une autre section de l'entreprise
(on parle de 50 à 70 personnes environ). Tout se passait bien, aussi bien sur le
plan humain que sur la montée en compétence de tout le monde. Sauf qu'une
trentaine de ces personnes faisait partie d'une entreprise prestataire.

Le contrat avec cette entreprise c'est terminée, et l'entreprise a prit un autre
prestataire. Comment ruiner des milliers d'heures cumulée de travail. L'histoire
fini plutôt bien, les nouveaux profils s'intégre bien et montent en compétences
tranquillement.


## Bilan de sécurité DevOps

L'important n'est pas d'écarter les menaces et de d'avoir 0 risques. L'important
c'est d'avoir les armes pour se défendre.


## Conclusion: La checklist a garder prés de soi
