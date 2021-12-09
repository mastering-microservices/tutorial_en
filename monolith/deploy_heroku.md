# Tutorial on Microservices Architecture with JHipster :: Deployment of the monolyth application

## Deploy the application (`prod` profile) on Heroku

Generate files for Heroku

```bash
jhipster heroku
```

```
Heroku configuration is starting
? Name to deploy as: store-12345
? On which region do you want to deploy ? eu
? Which type of deployment do you want ? JAR (compile locally)
? Which Java version would you like to use to build and run your app ? 11
```

The application is automatically deployed

Sign in into to the application https://$APPID.herokuapp.com/

```bash
APPID=store-12345
open https://$APPID.herokuapp.com/
```

Add a new `Product Category`.

Add a new `Product`.

## Check the application from the Heroku web console

Check your [Heroku's dashboard](https://dashboard.heroku.com/apps).

Check your [Heroku's datastore dashboard](https://data.heroku.com).

## Check the application from the Heroku CLI


```bash
APPID=store-12345

heroku login -i

heroku apps
heroku apps:info
heroku addons
heroku plugins
```

Check the application log

```bash
heroku logs --tail --app $APPID
```

Some useful Heroku commands

```bash
APPID=store-12345

heroku apps

heroku apps:info --app $APPID

heroku ps --app $APPID

heroku ps:scale web=2 --app $APPID

heroku releases --app $APPID

heroku drains --app $APPID
```

Turn off the application in maintenance

```bash
heroku maintenance:on --app $APPID

open https://$APPID.herokuapp.com/
```

Exit the application in maintenance

```bash
heroku maintenance:off --app $APPID

heroku stack --app $APPID

heroku status
```

## Deploy the application (`prod` profile) with the Heroku CLI

```bash
./gradlew -x test -Pprod
```
> `-x test` skip the tests

Deploy the JAR file
```bash
heroku deploy:jar build/libs/*jar --app $APPID
```

Open the web application
```bash
heroku open  --app $APPID
open https://$APPID.herokuapp.com
```

Have a look on the application's log
```bash
heroku logs --tail --app tuto-store
```

Have a look on the application's configuration
```bash
heroku config --app $APPID
```

## Destroy the application (`prod` profile) with the Heroku CLI

```bash
heroku apps:destroy --app $APPID  --confirm $APPID
```

```bash
open https://$APPID.herokuapp.com/
```
