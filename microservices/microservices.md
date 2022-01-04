# Tutorial on Microservices Architecture with JHipster :: Microservices

This part aims the generation and the deployment of an application following a microservices architecture with JHipster.

## Architecture

The architecture is composed of :
* the JHipster service registry
* The JHipster API Gateway
* one microservice `productorder` (using a `mysql` database)
* one microservice `invoice` (using a `postgres` database)
* one microservice `notification` (using a `mongodb` database)

The frontend acces to the microservices thru the API Gateway.

### Generation of the gateway (empty)
```bash
mkdir -p ~/github/mastering-microservices/gateway
cd  ~/github/mastering-microservices/gateway
jhipster
```
Answer to the questions:
```
? Which *type* of application would you like to create? Gateway application
? What is the base name of your application? gateway
? As you are running in a microservice architecture, on which port would like your server to run? It should be unique to 
avoid port conflicts. 8080
? What is your default Java package name? com.mycompany.store
? Which service discovery server do you want to use? JHipster Registry (uses Eureka, provides Spring Cloud Config support
 and monitoring dashboards)
? Which *type* of authentication would you like to use? JWT authentication (stateless, with a token)
? Which *type* of database would you like to use? SQL (H2, PostgreSQL, MySQL, MariaDB, Oracle, MSSQL)
? Which *production* database would you like to use? MySQL
? Which *development* database would you like to use? H2 with disk-based persistence
? Which cache do you want to use? (Spring cache abstraction) Ehcache (local cache, for a single node)
? Do you want to use Hibernate 2nd level cache? Yes
? Would you like to use Maven or Gradle for building the backend? Gradle
? Which other technologies would you like to use? 
? Which *Framework* would you like to use for the client? Angular
? Do you want to generate the admin UI? Yes
? Would you like to use a Bootswatch theme (https://bootswatch.com/)? Default JHipster
? Would you like to enable internationalization support? Yes
? Please choose the native language of the application English
? Please choose additional languages to install French
     info Disabling hibernate cache for cache provider no
? Besides JUnit and Jest, which testing frameworks would you like to use? Cypress, Gatling, Cucumber
? Would you like to install other generators from the JHipster Marketplace? No
? Would you like to generate code coverage for Cypress tests? [Experimental] No
```

### Generation of the (empty) microservice `productorder`
```bash
mkdir -p ~/github/mastering-microservices/productorder
cd  ~/github/mastering-microservices/productorder
jhipster
```
Answer to the questions:
```
? Which *type* of application would you like to create? Microservice application
? What is the base name of your application? productorder
? Do you want to make it reactive with Spring WebFlux? No
? As you are running in a microservice architecture, on which port would like your server to run? It should be unique to 
avoid port conflicts. 8081
? What is your default Java package name? com.mycompany.store
? Which service discovery server do you want to use? JHipster Registry (uses Eureka, provides Spring Cloud Config support
 and monitoring dashboards)
? Which *type* of authentication would you like to use? JWT authentication (stateless, with a token)
? Which *type* of database would you like to use? SQL (H2, PostgreSQL, MySQL, MariaDB, Oracle, MSSQL)
? Which *production* database would you like to use? MySQL
? Which *development* database would you like to use? H2 with disk-based persistence
? Which cache do you want to use? (Spring cache abstraction) Hazelcast (distributed cache, for multiple nodes, supports r
ate-limiting for gateway applications)
? Do you want to use Hibernate 2nd level cache? Yes
? Would you like to use Maven or Gradle for building the backend? Gradle
? Which other technologies would you like to use? 
? Would you like to enable internationalization support? Yes
? Please choose the native language of the application English
? Please choose additional languages to install French
? Besides JUnit and Jest, which testing frameworks would you like to use? Cypress, Gatling, Cucumber
? Would you like to install other generators from the JHipster Marketplace? No
```

### Generation of the (empty) microservice `invoice`

```bash
mkdir -p ~/github/mastering-microservices/invoice
cd  ~/github/mastering-microservices/invoice
jhipster
```
Answer to the questions:
```
? Which *type* of application would you like to create? Microservice application
? What is the base name of your application? invoice
? Do you want to make it reactive with Spring WebFlux? No
? As you are running in a microservice architecture, on which port would like your server to run? It should be unique to 
avoid port conflicts. 8082
? What is your default Java package name? com.mycompany.store
? Which service discovery server do you want to use? JHipster Registry (uses Eureka, provides Spring Cloud Config support
 and monitoring dashboards)
? Which *type* of authentication would you like to use? JWT authentication (stateless, with a token)
? Which *type* of database would you like to use? SQL (H2, PostgreSQL, MySQL, MariaDB, Oracle, MSSQL)
? Which *production* database would you like to use? PostgreSQL
? Which *development* database would you like to use? H2 with disk-based persistence
? Which cache do you want to use? (Spring cache abstraction) Hazelcast (distributed cache, for multiple nodes, supports r
ate-limiting for gateway applications)
? Do you want to use Hibernate 2nd level cache? Yes
? Would you like to use Maven or Gradle for building the backend? Gradle
? Which other technologies would you like to use? 
? Would you like to enable internationalization support? Yes
? Please choose the native language of the application English
? Please choose additional languages to install French
? Besides JUnit and Jest, which testing frameworks would you like to use? Cypress, Gatling, Cucumber
? Would you like to install other generators from the JHipster Marketplace? No
```

### Generation of the (empty) microservice `notification`
```bash
mkdir -p ~/github/mastering-microservices/notification
cd  ~/github/mastering-microservices/notification
jhipster
```

Answer to the questions:
```
? Which *type* of application would you like to create? Microservice application
? What is the base name of your application? notification
? Do you want to make it reactive with Spring WebFlux? No
? As you are running in a microservice architecture, on which port would like your server to run? It should be unique to 
avoid port conflicts. 8083
? What is your default Java package name? com.mycompany.store
? Which service discovery server do you want to use? JHipster Registry (uses Eureka, provides Spring Cloud Config support
 and monitoring dashboards)
? Which *type* of authentication would you like to use? JWT authentication (stateless, with a token)
? Which *type* of database would you like to use? MongoDB
? Which cache do you want to use? (Spring cache abstraction) Hazelcast (distributed cache, for multiple nodes, supports r
ate-limiting for gateway applications)
? Would you like to use Maven or Gradle for building the backend? Gradle
? Which other technologies would you like to use? 
? Would you like to enable internationalization support? Yes
? Please choose the native language of the application English
? Please choose additional languages to install French
? Besides JUnit and Jest, which testing frameworks would you like to use? Cypress, Gatling, Cucumber
? Would you like to install other generators from the JHipster Marketplace? No
```

### Launch the service registry

```bash
cd ~/github/mastering-microservices/gateway
docker-compose -f src/main/docker/jhipster-registry.yml up
```

### Launch the gateway (`dev` profile)

```bash
cd ~/github/mastering-microservices/gateway
./gradlew
```

### Browse the application

```bash
open http://localhost:8080
```
[More information ...](https://www.jhipster.tech/api-gateway/)

### Browse the service registry console
```bash
open http://localhost:8761
```
[More information ...](https://www.jhipster.tech/jhipster-registry/)

### Launch the microservice `productorder` (`dev` profile)
```bash
cd  ~/github/mastering-microservices/productorder
./gradlew
```
> Remark : H2 is the database system for `dev` porfile. A port conflit de port (`3306`) between the mysql container used by the gateway and the mysql container used by the gateway used by microservice.

Have a look on the Swagger descriptor
```bash
wget http://localhost:8081/v2/api-docs -O swagger.json
jq "." swagger.json
```

### Launch the microservice `invoice` (`dev` profile)
```bash
cd  ~/github/mastering-microservices/invoice
./gradlew
```

Have a look on the Swagger descriptor
```bash
wget http://localhost:8082/v2/api-docs -O swagger.json
jq "." swagger.json
```

### Launch the microservice `notification` (`dev` profile)
Launch the mongodb container
```bash
cd  ~/github/mastering-microservices/notification
docker-compose -f src/main/docker/mongodb.yml up -d
docker-compose -f src/main/docker/mongodb.yml logs -f
```

Wait for the readyness of mongodb

Launch the application in `dev` profile 
```bash
cd  ~/github/mastering-microservices/notification
./gradlew
```

Have a look on the Swagger descriptor
```bash
wget http://localhost:8083/v2/api-docs -O swagger.json
jq "." swagger.json
```

### Browse the application

```bash
open http://localhost:8080
```

> What can you see ?
> What's happen if one microservice is stopped (failure simulation ...)?

### Browse the service registry

```bash
open http://localhost:8761
```

> What can you see ?
> What's happen if one microservice is stopped (failure simulation ...)?

## Refactoring of the application schema

You should refactor the schema of the application online-store in three microservices and generate their source code.

The entities are scattered between
* the microservice productorder [productorder-jdl.jh](./productorder-jdl.jh)
* the microservice microservice invoice [invoice-jdl.jh](./invoice-jdl.jh)

New entities are added into the microservice notification [notification-jdl.jh](./notification-jdl.jh)

All the entities are described into [gateway-jdl-all.jh](./gateway-jdl-all.jh) for generating the frontend served by the API gateway.

The relationship OneToMany `ProductOrder{invoice} to Invoice{order}` is replaced by the property `invoiceId` into the entity `ProductOrder`.

## Generation of the frontend

```bash
cd  ~/github/mastering-microservices/gateway
jhipster import-jdl ../tutorial_en/microservices/gateway-jdl-all.jh
```

## Generation of the code of the microservice `productorder`

```bash
cd  ~/github/mastering-microservices/productorder
jhipster import-jdl ../tutorial_en/microservices/productorder-jdl.jh
```

## Generation of the code of the microservice `invoice`

```bash
cd  ~/github/mastering-microservices/invoice
jhipster import-jdl ../tutorial_en/microservices/invoice-jdl.jh
```

## Generation of the code of the microservice `notification`

```bash
cd  ~/github/mastering-microservices/notification
jhipster import-jdl ../tutorial_en/microservices/notification-jdl.jh
```

### Launch the service registry

```bash
cd ~/github/mastering-microservices/gateway
docker-compose -f src/main/docker/jhipster-registry.yml up -d
docker-compose -f src/main/docker/jhipster-registry.yml logs -f
```

### Launch the gateway
Lancez l'application en profil `dev`.
```bash
cd ~/github/mastering-microservices/gateway
./gradlew
```

### Launch the microservice `productorder` (`dev` profil)
Lancez l'application en profil `dev`.
```bash
cd  ~/github/mastering-microservices/productorder
./gradlew
```

### Launch the microservice `invoice` (`dev` profil)
Lancez l'application en profil `dev`.
```bash
cd  ~/github/mastering-microservices/invoice
./gradlew
```

### Launch the microservice `notification` (`dev` profil)
(Re)lauch the  mongodb container.
```bash
cd  ~/github/mastering-microservices/notification
docker-compose -f src/main/docker/mongodb.yml up -d
docker-compose -f src/main/docker/mongodb.yml logs -f
```

```bash
cd  ~/github/mastering-microservices/notification
./gradlew
```

## Build the Docker images

```bash
cd  ~/github/mastering-microservices/gateway
./gradlew -Pprod bootJar jibDockerBuild -x test
docker images | grep gateway

cd  ~/github/mastering-microservices/productorder
./gradlew -Pprod bootJar jibDockerBuild -x test
docker images | grep productorder

cd  ~/github/mastering-microservices/invoice
./gradlew -Pprod bootJar jibDockerBuild -x test
docker images | grep invoice

cd  ~/github/mastering-microservices/notification
./gradlew -Pprod bootJar jibDockerBuild -x test
docker images | grep notification
```

## Generation the docker-compose files
```bash
mkdir -p  ~/github/mastering-microservices/docker-compose
cd  ~/github/mastering-microservices/docker-compose
jhipster docker-compose
```

Answer to the questions:
```
? Which *type* of application would you like to deploy? Microservice application
? Which *type* of gateway would you like to use? JHipster gateway based on Netflix Zuul
? Enter the root directory where your gateway(s) and microservices are located ../
3 applications found at ~/github/mastering-microservices/
? Which applications do you want to include in your configuration? gateway, invoice, notification
? Which applications do you want to use with clustered databases (only available with MongoDB and Couchbase)? notification
? Do you want to setup monitoring for your applications ? Yes, for logs and metrics with the JHipster Console (based on ELK and Zipkin)
? You have selected the JHipster Console which is based on the ELK stack and additional technologies, which one do you want to use ? Curator, to help you curate and manage your Elasticsearch indices, Zipkin, for distributed tracing (only compatible with JHipster >= v4.2.0) JHipster registry detected as the service discovery and configuration provider used by your apps
? Enter the admin password used to secure the JHipster Registry admin
```

Launch the containers
```bash
docker-compose up -d
docker-compose ps
docker-compose logs -f
```

Add an extra instance for `invoice-app`

```bash
docker-compose scale invoice-app=2
```


## Monitor the microservices

[More detail](https://www.jhipster.tech/monitoring/).

```bash
cd ~/github/mastering-microservices
git clone https://github.com/jhipster/jhipster-console.git
cd jhipster-console
docker-compose up -d
docker-compose ps
docker-compose logs -f
```

Open the console
```bash
open http://localhost:5601
```

You should modify the property `logging.logstash.enabled=true` in the file `application-prod.yml` of the gateway and the microservices.

Regenerate and restart the containers.

Open the console
```bash
open http://localhost:5601
```

## Remark: Generate all the microservices
You can directly generate all the microservices with their entities 

```bash
mkdir -p ~/github/mastering-microservices/microservices
cd  ~/github/mastering-microservices/microservices
wget https://raw.githubusercontent.com/jhipster/jdl-samples/main/microservice-ecommerce-store-4-apps.jdl
```

Edit `microservice-ecommerce-store-4-apps.jdl` in order to change database systems (postgresql instead of mysql for the `invoice` microservice) and add properties to the `Product` entity.

```bash
jhipster import-jdl microservice-ecommerce-store-4-apps.jdl
```

