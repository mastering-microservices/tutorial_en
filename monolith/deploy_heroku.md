# Tutoriel sur les microservices avec JHipster :: Démarrage avec un monolithe

## Lancement l'application store en mode (ie profil) `prod` sur Heroku

Cont
```bash
jhipster heroku
```

```

```

Depuis la console Heroku, vérifiez que l'application `tuto-store` est créée.


```bash
./gradlew bootWar -x test -Pprod
```
> `-x test` n'exécute pas les tests


```bash
heroku login -i

heroku addons
heroku plugins

heroku plugins:install java

heroku deploy:jar --jar build/libs/store-0.0.1-SNAPSHOT.war --app tuto-store

heroku open  --app tuto-store
open https://tuto-store.herokuapp.com

heroku logs --tail --app tuto-store
# Failed to connect to mysql

heroku logs --tail --app tuto-store
```

Ajoutez le addon MySQL
```bash
open https://dashboard.heroku.com/apps/tuto-store/settings

heroku addons:open jawsdb  --app tuto-store

heroku config --app tuto-store
heroku config:get JAWSDB_URL --app tuto-store
```

Ajoutez les propriétés du add-on MySQL à configurer dans l'application
```bash
heroku config:set \
   JDBC_DATABASE_URL=jdbc:mysql://xxxxxxxx.xxxxxxxx.eu-west-1.rds.amazonaws.com:3306/dddddddddddd?verifyServerCertificate=false  \
   JDBC_DATABASE_USERNAME=uuuuuuuuuu  \
   JDBC_DATABASE_PASSWORD=pppppppppp  \
 --app tuto-store

#heroku config:unset PORT --app tuto-store

heroku logs --tail --app tuto-store
```

Attendez que le serveur soit prêt
```
2018-12-14T11:42:05.268557+00:00 app[web.1]: ----------------------------------------------------------
2018-12-14T11:42:05.268559+00:00 app[web.1]: Application 'store' is running! Access URLs:
2018-12-14T11:42:05.268560+00:00 app[web.1]: Local: 		http://localhost:52037
2018-12-14T11:42:05.268560+00:00 app[web.1]: External: 	http://172.17.78.18:52037
2018-12-14T11:42:05.268562+00:00 app[web.1]: Profile(s): 	[prod, heroku]
2018-12-14T11:42:05.268563+00:00 app[web.1]: ----------------------------------------------------------
```

Affichez la page du service quand celui ci est lancé.
```bash
heroku open  --app tuto-store
```


Quelques commandes supplémentaires avec Heroku:
```bash
heroku apps

heroku apps:info --app tuto-store

heroku ps --app tuto-store

heroku ps:scale web=2 --app tuto-store

heroku releases --app tuto-store

heroku drains --app tuto-store

heroku maintenance:on --app tuto-store

heroku maintenance:off --app tuto-store

heroku maintenance:on --app tuto-store

heroku stack --app tuto-store

heroku status
```


## Lancement l'application store en mode (ie profil) `prod` dans un container

Construisez l'image du conteneur
```bash
./gradlew bootWar -Pprod buildDocker
docker images | grep store
```

Lancez la composition docker-compose qui comporte l'application (`store-app`) et le gestionnaire de base de données (`store-mysql`).
```bash
docker-compose -f src/main/docker/app.yml up -d
```

Depuis un autre terminal, visualisez les consoles des 2 services
```bash
docker-compose -f src/main/docker/app.yml logs -f
```

Arrêtez le service `store-app` de la composition
```bash
docker-compose -f src/main/docker/app.yml stop store
```

Redémarrez le service `store-app` de la composition
```bash
docker-compose -f src/main/docker/app.yml start store
```

Arrêtez le service `store-mysql` de la composition
```bash
docker-compose -f src/main/docker/app.yml stop mysql
```
> Que se passe t'il ?

Redémarrez le service `store-mysql` de la composition
```bash
docker-compose -f src/main/docker/app.yml start mysql
```
> Que se passe t'il ?

Détruisez la composition.
> Remarque : les données rendues persistances dans les conteneurs sont définitivement perdues.

```bash
docker-compose -f src/main/docker/app.yml down
```

