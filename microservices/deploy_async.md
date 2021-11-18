# Tutoriel sur les microservices avec JHipster :: Microservices

## Communication entre microservices par envoi asynchrone de messages

L'objectif de cet exercice est d'implémenter le patron "[Message Passing](https://microservices.io/patterns/communication-style/messaging.html)" entre le microservice `productorder` et le microservice `notification`.

JHipster permet une communication entre microservices par l'envoi asynchrone de messages via des brokers de messages tels que RabbitMQ ou Apache Kafka. Cette fonction fait partie de [Spring Cloud Stream](https://cloud.spring.io/spring-cloud-static/Dalston.SR5/multi/multi__introducing_spring_cloud_stream.html).

En première partie, vous mettrez en place un canal de communication asynchrone avec le broker RabbitMQ entre ces 2 microservices.

En seconde partie, vous mettrez un canal de communication asynchrone avec le broker Kafka entre ces 2 microservices.

### Communication entre microservices par envoi asynchrone de messages avec RabbitMQ

Installez le [générateur generator-jhipster-spring-cloud-stream](https://github.com/hipster-labs/generator-jhipster-spring-cloud-stream)
```bash
yarn global add generator-jhipster-spring-cloud-stream
```

Lancez le générateur `generator-jhipster-spring-cloud-stream` avec le microservice `notification`
```bash
cd ~/github/mastering-microservices/notification
yo jhipster-spring-cloud-stream
git status
```

Lancez le générateur `generator-jhipster-spring-cloud-stream` avec le microservice `productorder`
```bash
cd ~/github/mastering-microservices/productorder
yo jhipster-spring-cloud-stream
git status
```
Répondez aux questions avec les mêmes réponses.

Plusieurs classes intéressantes sont générées dans les 2 projets:

La classe `com.mycompany.store.config.CloudMessagingConfiguration` implémente la connection au broker RabbitMQ.

Les propriétés suivantes sont ajoutées dans les fichiers de configuration `src/main/resources/config/application-*.yml` :
* `spring.cloud.stream.default.contentType`
* `spring.cloud.stream.bindings.input.destination`
* `spring.cloud.stream.bindings.output.destination`
* `spring.cloud.stream.bindings.rabbit.bindings.output.producer`

La classe `com.mycompany.store.domain.JhiNotificationEvent` est un exemple de message échangeable via RabbitMQ. Vous pourrez modifier et ajouter des propriétés ultérieurement.

La classe `com.mycompany.store.service.stream.NotificationEventSink` est un exemple de souscripteur de messages. Les messages recus sont stockés dans une liste (non persistante). Le topic de souscription est (par défaut) défini dans la propriété `spring.cloud.stream.bindings.input.destination` (`application-*.yml`)

La classe `com.mycompany.store.web.rest.NotificationEventResource` est un exemple de ressource
* avec une opération POST pour publier un message sur le topic (par défaut) défini dans la propriété `spring.cloud.stream.bindings.output.destination` (`application-*.yml`)
* avec une opération GET pour récupérer la liste non persistance des messages recus du topic

Lancez de RabbitMQ depuis un des 2 projets (`notification` par exemple) sur Term 1:
```bash
cd ~/github/mastering-microservices/notification
docker-compose -f src/main/docker/rabbitmq.yml up -d
docker-compose -f src/main/docker/rabbitmq.yml logs -f
```

Lancez le micro-service `notification` sur Term 2:
```bash
~/github/mastering-microservices/notification
./gradlew
```

Lancez le micro-service `productorder` sur Term 3:
```bash
~/github/mastering-microservices/notification
./gradlew
```

Ouvrez la console de management de RabbitMQ (avec les crententials par défaut `guest` `guest`)

```bash
open http://localhost:15672/#/
```

Testez l’envoi de messages via l’interface Swagger UI (disponible depuis `Administration > API > productorder`)

Afficher les messages recus via l’interface Swagger UI (disponible depuis `Administration > API > notification`)

> NB: les messages peuvent être sérialisés dans différents formats comme Java Serialization, JSON, Thrift, Protobuf ... pour être échangés avec des micro-services Java et non-Java. [Plus de détails](https://cloud.spring.io/spring-cloud-static/Dalston.SR5/multi/multi_contenttypemanagement.html)

Vérifiez la non persistance des messages en redémarrant le micro-service `notification`. L'opération GET retourne une liste vide.

Pour le microservice `productorder`:
* Vous pouvez éliminer des sources du microservice `productorder`, les lignes de code relatives à la reception des messages (opération `GET` de la classe `NotificationEventResource` et la classe `NotificationEventSink`).
* Vous pouvez également changer le nom du topic dans la propriété `spring.cloud.stream.bindings.output.destination` (`application-*.yml`).

Pour le microservice `notification`:
* Vous pouvez éliminer des sources du microservice `notification`, les lignes de code relatives à l'émission des messages (opération `POST` de la classe `NotificationEventResource`).
* Vous pouvez également changer le nom du topic dans la propriété `spring.cloud.stream.bindings.input.destination` (`application-*.yml`).
* Vous pouvez modifier et ajouter des propriétés à la classe `JhiNotificationEvent` dans les 2 projets. Vous pouvez persister les messages reçus dans la base MongoDB en créant des entités `Notification`.


### Communication entre microservices par envoi asynchrone de messages avec Kafka
* https://www.jhipster.tech/using-kafka/

Regénérez les 2 microservices en sélectionnant `Asynchronous messages using Apache Kafka` lors de la génération.


```bash
mkdir -p ~/github/mastering-microservices/notification_kafka
cd ~/github/mastering-microservices/notification_kafka
jhipster
```

```
? Which *type* of application would you like to create? Microservice application
? What is the base name of your application? notification
? As you are running in a microservice architecture, on which port would like your server to run? It should be unique to avoid port conflicts. 8083
? What is your default Java package name? com.mycompany.store
? Which service discovery server do you want to use? JHipster Registry (uses Eureka, provides Spring Cloud Config support and monitoring dashboards)
? Which *type* of authentication would you like to use? JWT authentication (stateless, with a token)
? Which *type* of database would you like to use? MongoDB
? Do you want to use the Spring cache abstraction? Yes, with the Hazelcast implementation (distributedcache, for multiple nodes)
? Would you like to use Maven or Gradle for building the backend? Gradle
? Which other technologies would you like to use? Asynchronous messages using Apache Kafka
? Would you like to enable internationalization support? Yes
? Please choose the native language of the application English
? Please choose additional languages to install French
? Besides JUnit and Jest, which testing frameworks would you like to use? Gatling, Cucumber
? Would you like to install other generators from the JHipster Marketplace? No
```

```bash
mkdir -p ~/github/mastering-microservices/productorder_kafka
cd ~/github/mastering-microservices/productorder_kafka
jhipster
```

La génération crée la classe `com.mycompany.store.config.MessagingConfiguration` et ajoute les 3 propriétés suivantes dans les fichiers de configuration `src/main/resources/config/application-*.yml` :
* `spring.cloud.stream.kafka.binder.brokers`
* `spring.cloud.stream.kafka.binderzk-nodes`
* `spring.cloud.stream:.bindings.output.destination`

Lancez de Kafka depuis un des 2 projets (`notification` par exemple) sur Term 1:
```bash
cd ~/github/mastering-microservices/notification_kafka
docker-compose -f src/main/docker/kafka.yml up -d
docker-compose -f src/main/docker/kafka.yml logs -f
```

Utilisez les classes `NotificationEventResource` et `NotificationEventSink` générées et modifiées à l'étape précédente.

## Fiabilisation des communication inter-microservices

Installez et lancez le [sous-générateur swagger] (https://www.jhipster.tech/modules/marketplace/#/details/generator-jhipster-swagger-cli)
```bash
npm install -g generator-jhipster-swagger-cli
yo jhipster-swagger-cli
```
Répondez aux questions suivantes:
```
? Where is your Swagger/OpenAPI spec (URL or path) ? http://petstore.swagger.io/v2/swagger.json
? What is the unique name for your API client ? petstore
? Do you want to save this config for future reuse ? No
```

Jetez un coup d'oeil au code généré
```bash
tree src/main/java/com/mycompany/store/client/
```

[Plus d'information sur Feign](https://www.jhipster.tech/using-uaa/#inter-service-communication)

## Gestion et authenfication OAuth2 des utilisateurs

Plusieurs gestionnaires d'authentification des utilisateurs sont proposés par le générateur JHipster. https://www.jhipster.tech/security/

### Gestion et authenfication OAuth2 des utilisateurs avec JHipster UAA

Regénerez la gateway
```bash
mkdir -p ~/github/mastering-microservices/uaa
cd  ~/github/mastering-microservices/uaa
jhipster

```

```
? Which *type* of application would you like to create? JHipster UAA server (for microservice OAuth2 authentication)
? What is the base name of your application? uaa
? As you are running in a microservice architecture, on which port would like your server to run? It should be unique to avoid  port conflicts. 9999
? What is your default Java package name? com.mycompany.store
? Which service discovery server do you want to use? JHipster Registry (uses Eureka, provides Spring Cloud Config support and monitoring dashboards)
? Which *type* of database would you like to use? SQL (H2, MySQL, MariaDB, PostgreSQL, Oracle, MSSQL)
? Which *production* database would you like to use? MySQL
? Which *development* database would you like to use? H2 with disk-based persistence
? Do you want to use the Spring cache abstraction? Yes, with the Hazelcast implementation (distributed cache, for multiple nodes)
? Do you want to use Hibernate 2nd level cache? Yes
? Would you like to use Maven or Gradle for building the backend? Gradle
? Which other technologies would you like to use?
? Would you like to enable internationalization support? Yes
? Please choose the native language of the application English
? Please choose additional languages to install French
? Besides JUnit and Jest, which testing frameworks would you like to use? Gatling, Cucumber
? Would you like to install other generators from the JHipster Marketplace? No
```

Regénérez l'API gateway et les microservices en sélectionnant le JHipster UAA server pour l'authentification.

[Plus d'information sur JHipster UAA](https://www.jhipster.tech/using-uaa/)

### Gestion et authenfication OAuth2 des utilisateurs avec Keycloak


```bash
mkdir -p ~/github/mastering-microservices/gateway_keycloak
cd  ~/github/mastering-microservices/gateway_keycloak
jhipster
```
Répondez aux questions suivantes:
```
? Which *type* of application would you like to create? Microservice gateway
? What is the base name of your application? gateway
? As you are running in a microservice architecture, on which port would like your server to run? It should be unique to avoid port conflicts. 8080
? What is your default Java package name? com.mycompany.store
? Which service discovery server do you want to use? JHipster Registry (uses Eureka, provides Spring Cloud Config support and monitoring dashboards)
? Which *type* of authentication would you like to use? OAuth 2.0 / OIDC Authentication (stateful, works with Keycloak and Okta)
? Which *type* of database would you like to use? SQL (H2, MySQL, MariaDB, PostgreSQL, Oracle, MSSQL)
? Which *production* database would you like to use? MySQL
? Which *development* database would you like to use? H2 with disk-based persistence
? Do you want to use Hibernate 2nd level cache? Yes
? Would you like to use Maven or Gradle for building the backend? Gradle
? Which other technologies would you like to use?
? Which *Framework* would you like to use for the client? Angular 6
? Would you like to enable *SASS* support using the LibSass stylesheet preprocessor? Yes
? Would you like to enable internationalization support? Yes
? Please choose the native language of the application English
? Please choose additional languages to install French
? Besides JUnit and Jest, which testing frameworks would you like to use?
? Would you like to install other generators from the JHipster Marketplace? No
```

```bash
jhipster import-jdl ../tutorial/gateway-jdl-all.jh
```

Lancez le container keycloak
```bash
docker-compose -f src/main/docker/keycloak.yml up -d
docker-compose -f src/main/docker/keycloak.yml ps
docker-compose -f src/main/docker/keycloak.yml logs -f
```

Lancez le service de registre
```bash
cd  ~/github/mastering-microservices/gateway_keycloak
docker-compose -f src/main/docker/jhipster-registry.yml up -d
docker-compose -f src/main/docker/jhipster-registry.yml logs -f
```

Lancez la gateway en profil `dev` et les microservices.
```bash
cd  ~/github/mastering-microservices/gateway_keycloak
./gradlew
```

Loggez-vous via la gateway (admin Administration)
```bash
open http://localhost:8080
```
> Que se passe t'il ?

Loggez-vous sur la console d'adminstration de Keycloak (admin admin)
```bash
open http://localhost:9080
open http://localhost:9080/auth/admin/master/console/#/realms/jhipster
```

Configurez le realm jhipster pour
* créer de nouveaux utilisateurs,
* changer le thème,
* autoriser le login via les réseaux sociaux,
* activer le One Time Password (via [Google Authenticator](https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2)),
* ...

![Keycloak Console ](./keycloak-console.png)

[Plus d'information sur Keycloak](https://www.jhipster.tech/security/)

### Gestion et authenfication OAuth2 des utilisateurs avec OKTA

[Plus d'information sur OKTA](https://www.jhipster.tech/security/)

### "Backend for Frontend Pattern" pour l'application Ionic store-ion

Générez une seconde gateway exposant une API simplifiée de `online-store.jh` pour l'application mobile Ionic `store-ion`.
