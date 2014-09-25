---
layout: post
title: "Tell the world I'm developping free softwares"
date: 2014-09-20 13:33:42
categories: python communication
---

Salut les dev !

Cela fait maintenant quelques mois que j'ai commencé à développer une nouvelle solution pour lire mes mails, je viens
donc partager ce projet avec vous.


Le problème est simple, pour lire les mails, y a pas mal de solutions assez différentes, et pour celles que je connais,
aucune ne me convient pleinement.

Je vais donc passé la partie "Gros Râleur Barbu" parce que premiérement c'est chiant à lire, et deuxiémement, je ne me
trouve pas si gros que ça !


J'ai donc un probléme avec les clients mails et si je réfléchi deux secondes :

    * Je suis un développeur
    * J'aime Python
    * Dans Python on a *Imaplib*

Il ne faut pas trop longtemps pour comprendre que communiquer avec un serveur IMAP, c'est pas sorcier, tout les outils
sont là… ou presque :(

*imaplib* est très bien, au petit détail prés que pour s'en servir, il faut connaitre la RFC IMAP par cœur, et je
pense qu'on ne peux décemment pas demander aux utilisateurs, et même aux programmeurs, de connaitre cette RFC.

J'ai donc pris la décision de concevoir et écrire une petite librairie qui reprend les spécifications IMAP et la
librairie imaplib, et qui rend accessible, via une API Python claire et documentée les différentes fonctionnalités du
protocole.


L'adresse du projet : http://gentux.github.io/imap-cli/
Le repos GIT du projet : http://github.com/Gentux/imap-cli
La documentation du projet : http://imap-cli.readthedocs.org/en/master/

Le projet est disponnible sur Pypi, j'espére qu'il sera bientôt disponible sous la forme de paquet Debian.


J'ai aussi pour projet d'exposer le projet sur LinuxFR, et pourquoi pas d'autres media si ça fonctionne.

Je ne l'ai pas précisé non plus, mais ce projet est toujours en développement. Certaines fonctionnalités spécifiées par
IMAP ne sont pas implémentées. Aussi, à l'heure actuelle, il y a sûrement des bug non détectées car pas assez
d'utilisateur.

N'hésitez pas à ouvrir des "issues" dans Github : https://github.com/Gentux/imap-cli/issues/new
