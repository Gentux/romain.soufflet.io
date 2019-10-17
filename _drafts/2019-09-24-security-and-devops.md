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


Dans mes différentes missions je suis réguliérement aspiré par des problèmatiques
transversent et parfois abstraites. Les personnes que je rencontre cantonne bien
trop souvent La culture Devops aux domaines techniques.

Aujourd'hui, j'aimerai parler d'un théme récurrent et indispensable pour tout
système d'information : La sécurité.

Attention je ne compte pas être exhaustif dans cet article, je veux juste
transmettre les clefs pour que vous compreniez les enjeux du sujets.

<!--more-->

J'ai eu la chance de travailler avec des experts en sécurité durant les derniers
mois et mon client m'a donc naturellement demander de faire entrer les exigences
de sécurité dans sa transition *DevOps*.

Le maitre mot avec ce genre de problématique est le *pragmatisme* : savoir
rester réaliste quand à vos exigences et savoir être créatif pour proposer des
solution.

## De quoi parle-t-on concrétement

Dans les différentes entreprises par lesquels je suis passé, la sécurité prenait
plusieurs formes. Parfois je rencontrais des réferrents sécurité, parfois des
équipes sécurité ou parfois des réunions sécurité. Peu importe la forme, il faut
avant tout garder un esprit bienveillant : La sécurité est un sujet utile et
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

Dans la suite de cette article, nous allons définir la sécurité comme l'ensemble
des mesures qui on pour but de garantir le maintiens de la production en
condition opérationnel.

## Mini audit maison sans consultant spécialisé

J'entends parler des *audit* depuis le premier jour de mes études post-bac,
cependant il m'a fallut quelques temps pour bien comprendre de quoi il s'agit.

Quand une entreprise demande un audit sur ces process on pourrait faire le
parallèle avec une enquête interne pour mieux comprendre le fonctionnement de
l'entreprise. La finalité est souvent rendu sous formes de documents PDF
accompagné d'une joli présentation par l'équipe qui réalise l'audit.

L'audit de sécurité est communs dans les projets informatiques. Souvent il coûte
cher, prend du temps et reste un passage obligatoire. Dans les grandes
structures il peut même parfois s'agir d'un pré-requis avant de passer en
production.

Dans ce documents seront définit les notions de risques et de menaces. Les
termes peuvent changer mais l'idée reste la même.

Prenons un exemple : Un dégat des eau.

TODO: mettre une image

Par économie, l'entreprise à installer les serveurs chez Mémé, son appartement
en plein cœur de paris nous offres une connexions stable et rapide tandis que
ses oreilles vieillissantes ne sont pas dérangées par le bruit de notre baie de
server.

Comme dans tout immeuble parisien il y a un risque de dégats des eaux. Cet
évênement est une *menace* dans notre audit et le niveau de risque est élevé
car ce problème est très probable dans les immeuble parisien.

Et aprés ? À quoi cela sert-il ? C'est là que le domaine *sécurité* est
particulier, l'audit en lui-même n'a pas de valeur. Ce qui est important c'est
ce que l'entreprise fera avec.

Si l'on reprend notre exemple, une décision logique serait de migrer nos serveurs
dans un bâtiment prévu à cet effet. Cependant, cela engendre un coût financier
et un arbitrage en fonction de l'entreprise.

Les notions de risques et de menaces sont centrales dans un audit de sécurité,
mais je laisse ce travail à d'autre. En tant que défenseurs de l'idéologie
DevOps, mon rôle et de préparer l'entreprise à cet audit et de mettre en place
des mesures concréte.


## Mesure concréte #1 : Survivre à l'apocalypse

Le but d'un audit c'est d'identifier les menaces et leurs niveaus de risques.
Autrement dit avec mes propres mots : s'assurer que rien n'empêchera la
production de tourner.

Beaucoup de scénario d'attaque sont possible, et il y n'y a pas que ceux qui
figure dans l'audit. Il y a des failles dans tout les logiciels que nous
utilisons, des risques dans tout les bâtiments que nous construisons. Se couvrir
de toute les possibilités est impossible.

Par conséquent, on reste pragmatique et on envisage le pire.

Premier scnénario à évoquer est la perte pur et simple de l'environnement. La
menace est critique, le risque est élevé. Aprés plusieurs années à travailler
dans ce domaines, je continue de m'étonner à voir que nos environnement sont si
fragile.

J'ai déjà écrit sur ce point dans l'article sur les [DevOps et SRE](url ici).
Alors tant pis si je me répète, c'est important : Redéployez souvent. C'est
l'un des pilliers du travail d'industrialisation dans la culture DevOps. Êtres
capable de tout redéployer en partant de zero permet de s'assurer que peu
importe le danger auxquel nous faisons face, nous pourrons y remédier.

Un petit bémole cependant est de savoir jusqu'où vous prévoyez de vous protéger.

Si l'entreprise est hébergé par AWS par exemple et que ce dernier tombe, est-ce
que nous prévoyons un plan de secour chez GCP ? La risque est faible mais les
efforts pour prévenir cette menace peuvent être conséquent. Chaque entreprise
doit donc arbitrer en fonction de sa situation et de ses moyens.

## Mesure concréte #2 : Reconstruire après l'apocalypse

La seconde partie la plus importante dans votre environnement de production est
la partie *data*. La pluparts des services actuelles n'ont plus aucune utilité
sans leurs données.

Cela m'étonne toujours de voir que des entreprises ne prennent pas cette partie
plus au sérieux. Vous trouverez une tonne de documentation sur internet
concernant le sujet *backup/restore* mais j'aimerais vous donner une vision
d'ensemble du sujet sans rentrer dans les considération technique. Je vais donc
abstraire et simplifier en 4 niveau.

Niveau 1 : Le disque local. Même sur un orchestrateur de conteneurs comme
Kubernetes qui traite des *volumes*, derrière cette notion de volumes se cache
des disque dur sur la machines qui execute votre conteneur. Il faut toujours
considérer que cette forme de stockage est volatile et peu fiable. Cela reste
le stockage le plus important de votre production puisque c'est celui qui est
utilisé en premier lieu par les clients.

Niveau 2 : Réplication du premier niveau. Nous pouvons nous satisfaire d'une
copie simple du disque sur un deuxième dans beaucoup d'application. *PostgreSQL*
par exemple gére parfaitement bien depuis des années cette réplication d'un
*master* à l'identique sur une machine *slave*. Dans les environnements
*scalable* (avec beaucoup plus de machines et de données) nous parlerons de
stratégie de réplications car il ne sera pas possible d'avoir toutes les
données sur tout les disques. Le but dans ces déploiements et des garantir que
chaque données est présente sur 2, 3 ou *N* disques à tout moments.

Niveau 3 : Backup. Reconstruire votre environnement à partir de zero tel que je
le décrit dans la [Mesure concréte #1]() néscessite de pouvoir retrouver les
données. *Le rôle du backup est de pouvoir être restauré*. Peut importe la
manière que vous emploirez pour créer ce backup, assurez-vous d'être en mesure
de restaurer vos machines à partir de celui ci. Détruire et reconstruire
régulièrement votre environnement de pre-production est un bon moyen de vous
assurer que ces backups sont utilisables. L'opération de construction du backup
et sa sauvegarde sont réalisé quotidiennement (c'est le cas le plus fréquent).
Ceci néscessite donc que les machines de productions ait accès à la baie de
stockage des backups, ce qui nous ammène au niveau 4.

Niveau 4 : La sauvegarde à froid. Ce dernier niveau est une sorte de
contre-mesure pour les backups. Imaginons la menace d'un incendit de votre salle
serveur. Le risque est faible mais si les backups brûlent avec votre
environnement de production, cela peut tuer l'entreprise. Une copie sur un
disque dur en local qu'on stocke dans la cave chez Mémé permet d'améliorer la
sécurité pour un coût relativement négligeable. Nous appelons cele *stockage a
froid* (le *chaud* faisant reférence à l'environnement de production)

## Mesure concréte #3 : Prévenir l'apocalypse

Les deux première mesure que je présente sont essentielles. Savoir reconstruire
à partir de rien et restaurer les données c'est garantir qu'on pourra reprendre
l'activité peu importe la gravité de la situation.

Vu sous un autre angles, nous avons considérer que notre environnement de
production peut se trouver dans seulement deux états différent: Un premier dans
lequel il fonctionne parfaitement et un second dans lequel rien n'est
accessible.

Ce n'est malheureusemenet pas aussi simple.

Il existe toute une variété d'état entre le *vert* et le *rouge* où le service
se retrouve dégradé. Les causes probables de défaillance et leur conséquence
sont très nombreuse et parfois subtiles. Voici quelques exemples:

* L'application met plus de temps à répondre
* Des messages d'erreur apparaissent parfois à l'utilisateur
* Une partie du produit n'est plus accessible
* Les emails ne sont plus reçu par les utilisateurs
* Et bien d'autres

Tout ces problèmes ont une origine technique. Les technologies ne sont pas
magique, une fonctionnalités en état de marche ne se met pas à défaillir sans
raisons. Les équipes techniques mettront bien souvent plus de temps à déterminer
la cause du disfonctionnement plutôt qu'a le résoudre.

Pour aider les équipes à remettre tout en état de marche, nous allons mesurer
l'état de notre système par l'intérmédiaire de sondes. Je vais généraliser ce
concept pour éviter de partir sur les considérations techniques.

Les sondes sont donc de petits programmes qui vont collecter des metriques.
Chaque sonde ira chercher une information temporelle et associera une valeur à
une date. Ces couples de valeurs et de date nous permette de constituer une
série de données (*timeseries* en anglais). Puis nous multiplirons les sondes
pour avoir l'états de tout les composants de notre production.

Le principal avantage de cette approche est de pouvoir mettre ces données dans
un graphique et ainsi constituer de beaux tableau de bord qui nous donne une
vision plus précises et plus visuel de nos environnements.

[Capture d'ecran grafana](url)

// Il manque une paragraphe ou deux sur les alertes

// Relecture

## Mesure concréte #4 : Construire son bastion

Nous avons les moyens de mesurer les performances de notre produit ou de notre
service. Cependant, pour que ces performance reste optimal, nous devons protéger
nos environnement.

On va donc passer aux mesures et contres mesures de sécurité. Ces un sujet que
j'apprécie particulièrement car il me donne l'impression de faire partie de
l'équipe de James Bond. Ici on va pouvoir marteler des phrases comme « Ne faites
confiance à rien ni personnes » ou encore « Méfiez vous de votre réseau ». Nous
allons même pouvoir parler *firewall* et *encryption* comme dans les séries
américaines.

Commençons par parler de *chiffrement*. Il s'agit d'un domaine passionnant qui
transforme n'importe quel phrase en une série de chiffres et permet au
destinataire de retransformer ces chiffres pour lire la phrase d'orgine. Là où
ce domaine est particulièrement intéressant, c'est qu'il est possible d'avoir
une conversation avec un inconnu à l'autre bout du monde et quand même être sûr
que cette personne est la seule au monde à pouvoir lire votre message.

En réalité, cette dernière affirmation est très théorique. Nous avons des
démonstration mathématique pour évaluer la difficulté à déchiffrer le message.
Cependant, entre la demonstration et la pratique, nous avons l'implémentation
qui parfois recèle des anomalies.

Ce qui nous méne aux mise à jour de sécurités. Lorsqu'une faille est découverte,
elle est rendu publique. Cela ne se fait pas du jour au lendemain, en général
nous avons déjà installà la mise à jour avant d'être au courant qu'il y a une
faille.

Néanmoins, en chiffrant les échanges avec le clients, nous garantissons aux
clients qu'ils sont bien en train de communiquer avec nous et que leur données
ne parviennent qu'à nous.

Suivons donc ces données, maintenant que nous les avons reçu, les clients
s'attendent à ce que nous les protégions. J'ai déjà parler un peu plus haut de
la partie sauvegarde et backup, par contre je n'ai pas préciser qu'il vous est
possible d'anonymiser les données ou de les chiffrer.

TODO: étoffer anonymisation et chiffrement

TODO: gérer les accés SSH => Bastion

## Mesure concréte #7 : Au delà du domaine technique

Toutes les mesures évoqué jusqu'à maintenant sont d'ordre technique. Un autre
point à noter c'est que toutes ces mesures peuvent et doivent être entreprises
pendant le développement du projet.

Maintenant, nous allons explorer l'application du point de vue d'un auditeur. Il
y a beaucoup plus dans un projet informatique que l'aspect techniques.
Typiquement, la première question d'un auditeur qui n'a aucune connaissance du
projet sera « Quelles sont les différents rôle dans votre application ? ».

Cette question permet de poser les bases de l'analyse, je conseil
personnellement de toujours maintenir cette question au fur et à mesure que vos
produits évoluent car la réponse peut être structurante au niveau technique.

Dans les rôles, on pourra trouver des *admins* et *utilisateurs* avec parfois un
peu plus de nuances tel que *modérateurs*. Mais ces rôles sont définit dans le
code applicatifs et font partie de votre réflexions *produit*. Ce qui
m'intéresse ici, ce sont les rôle autour de l'application tel que *exploitant*
ou *developpeur*.

À quoi ont accés les développeurs de l'application ? Au code source bien
évidemment, mais ont-ils accès en SSH sur les serveur de production ? Ils ne
sont pas censé en avoir besoin et c'est pourtant bien souvent le cas.

La culture DevOps quand à elle favorise la communication entre ces différents
rôle mais ne vous permettra pas de vous en affranchir. Mettre cette réflexions
sous le tapis à base de « Mon équipe est DevOps » est une très mauvaise idée.

Dans un monde idéal avec des pipeline d'intégration continue et de déploiement
continue, c'est le système de déploiement continue qui devient *l'exploitant* de
votre application. Ce rôle existe toujours et il est bien distincte du rôle
*développeur*.

L'audit de sécurité va vous encourager à segmenter et isoler tout ces différents
rôles et cela peut vite devenir un problèmes. En suivant des recommendation à la
lettre on se retrouve vite a siloter l'entreprise.

Gardez à l'esprit que l'audit est souvent réaliser par une personne externe qui
ne connait pas votre produit ni votre entreprise. Vous avez le contrôle de vos
équipes et de votre manière de travailler, c'est donc vous qui pourront définir
les meilleurs stratégie pour garantir la sécurités.

Résumons un peu tout ça pour garder un peu de concrét. Tout au long de votre
projet vous devrez maintenir la liste des différents rôle autour de votre
application (en général nous avons le *développement*, *l'intégration* et
*l'exploitation*). A chaque rôle, savoir quels personnes peuvent endosser le
rôle, on parle ici d'accréditation et cela s'accompagne de savoir comment
intégrer les nouveaux arrivants mais aussi de savoir comment refuter l'accès aux
anciens employés. Ensuite vous devriez avoir un moyen de tracer quel personne à
mener quel actions et quand.

Ça fait beaucoup de choses à mettre en place mais rassurez-vous, nous n'avons
pas besoin de tout faire parfaitement.

Une derniére note sur ces points. Il arrive dans les équipes de petites taille
que chaque individu prenne en charge un nombre d'opération conséquent. Cela
devient un problème si la personnes quitte l'entreprise.

Nous désignons régulièrement ce phénomène *Bus Factor* car l'image choc qui
permet de faire prendre conscience du problème c'est d'imaginer une personne
indisensable se faire écraser par un bus. C'est un problème récurrent même dans
les grand groupes ou certaines personne se rendent indispensable.

Pour contrer cela, l'idéal et d'avoir toujours au moins 2 personnes capable
d'effectuer toute actions. Il est aussi très important de simplifier toutes les
procédure d'exploitation et de les documenter afin que vous soyez en mesure de
les executer même en cas d'absence des personnes compétentes.

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
c'est d'avoir les armes pour se défendre. Vous aurez toujours besoin de faire
des choix et des compromis entre le niveau de sécurité souhaité et vos capacités
à mener les bon chantier à terme.

J'ai tenté au fur et à mesure de mes différentes expérience de maintenir une
check-list des grandes étapes pour mettre en place un système de production
résilient et sécurisé. Ce fut un échec, car pour chaque client je recommence
cette liste en prenant d'autres contraintes en compte.

Avec cette article, j'espère avoir donner suffisament de piste pour que vous
puissiez orienté vos travaux sécurité au mieux.
