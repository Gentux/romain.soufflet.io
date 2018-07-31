# Repenser les job runners, from scratch


* Au cœur de mon métier **Infra as Code**
* Mais c'est relou de configurer tout plein de clickodrome dans tout les sens

Alors je me suis dis que j'allais coder un truc pour ça !!

Let's do some POC

Sauf que je suis une bille en frontend, chacun son métier :)


## Tout d'abord, rien à voir avec Ractive : La backend

* Je veux faire tourner des scripts:
** Des containers docker basiquement en précisant le "FROM"
** Préciser le Dockerfile si j'ai envie
** Préciser la commande que je veux lancer avec mon container
** Préciser les paramètre de la commande que je lance, tant qu'a faire

* Je veux pouvoir enregistrer la sortie des script
* Je veux stocker le code de retour de mes scripts


## From nico

Mes idées de features structurantes:
- Event-based: un webhook GH ou Slack, c’est traité pareil
- Auto-rebase
- Pouvoir définir les jobs ailleurs que dans le repo
- Pouvoir “cascader”: un push sur un repo lance des tests ailleurs
- Capable de proposer des fix


API Simple

* On veut juste lancer des jobs et récupérer un ID de job
* On veut pouvoir check le status d'un job avec son ID
* On veut pouvoir récupérer les logs d'un job via son ID
* On veut la liste des scripts enregistrer avec leur parametre

Un job se lance quand il reçoit le signal de ce lancer => RabbitMQ
Un job donne un signal lorsqu'il s'arrête.

## Maintenant qu'on a notre job runner, on veut une UI qui déchirre !!

On va gérer les branches de nos repos git comme autant d'évennement différent

* Nouveau repos ?
* Nouveau commit ?
* Nouvelle branche ?

* Assigner chaque event à une tâche du job builder
* Listen les résultat du job builder pour avoir de nouveaux evennement
* Les revues de code sont aussi des évennement

## Ok, ça marche bien, mais c'est moche !

* On va où maintenant ?
