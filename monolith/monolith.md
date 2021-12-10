# Tutorial on Microservices Architecture with JHipster :: Generate a monolith application

## Get the files
```bash
mkdir -p ~/github/mastering-microservices/
git clone https://github.com/mastering-microservices/tutorial_en.git
```

## Generate the basic application
```bash
mkdir -p ~/github/mastering-microservices/online-store
cd  ~/github/mastering-microservices/online-store
jhipster
```

```
? Which *type* of application would you like to create? Monolithic application (recommended for simple projects)
? What is the base name of your application? store
? Do you want to make it reactive with Spring WebFlux? No
? What is your default Java package name? com.mycompany.store
? Which *type* of authentication would you like to use? JWT authentication (stateless, with a token)
? Which *type* of database would you like to use? SQL (H2, PostgreSQL, MySQL, MariaDB, Oracle, MSSQL)
? Which *production* database would you like to use? PostgreSQL
? Which *development* database would you like to use? H2 with disk-based persistence
? Which cache do you want to use? (Spring cache abstraction) Ehcache (local cache, for a single node)
? Do you want to use Hibernate 2nd level cache? Yes
? Would you like to use Maven or Gradle for building the backend? Gradle
? Do you want to use the JHipster Registry to configure, monitor and scale your application? No
? Which other technologies would you like to use? 
? Which *Framework* would you like to use for the client? Angular
? Do you want to generate the admin UI? Yes
? Would you like to use a Bootswatch theme (https://bootswatch.com/)? Default JHipster
? Would you like to enable internationalization support? Yes
? Please choose the native language of the application English
? Please choose additional languages to install French
? Besides JUnit and Jest, which testing frameworks would you like to use? Cypress, Gatling, Cucumber
? Would you like to install other generators from the JHipster Marketplace? No
? Would you like to generate code coverage for Cypress tests? [Experimental] No
```

> Remark: Have a glance on available sub-generators (some are not compliant with the current version of JHipster): https://www.jhipster.tech/modules/marketplace/#/list


Read the commit message

```bash
git log
```

Check the generation parameters

```bash
cat .yo-rc.json
ls -al .jhipster
```

Count the lines of code

```bash
cloc src/ webpack/
cloc src/ webpack/ *.json *.xml
```

Estimate the cost and the time for coding the basic application using https://stackoverflow.com/jobs/salary and a [Cocomo calculator](http://softwarecost.org/tools/COCOMO/)


Read the readme

```bash
cat README.md
```

Run the application in `dev` profile.

```bash
./gradlew
```

Sign in as `admin` `admin` and browse the menu (including the API Swagger thru Swagger UI).

```bash
open http://localhost:8080
```

## Generate the entities and the relationships

Show the [schema of the monolith application](./online-store.jh) with [JDL Studio](https://start.jhipster.tech/jdl-studio/). The scrrenshot is[here](./online-store.jh.png).

Generare the source files (for the frontend and the backend) according the entities et the relationships.
```bash
cd  ~/github/mastering-microservices/online-store
jhipster import-jdl ../tutorial_en/monolith/online-store.jh
```

Check the generation parameters

```bash
cat .yo-rc.json
ls -al .jhipster
```

Count the lines of code

```bash
cloc src/ webpack/
cloc src/ webpack/ *.json *.xml
```

Estimate the cost and the time for coding the basic application using https://stackoverflow.com/jobs/salary and a [Cocomo calculator](http://softwarecost.org/tools/COCOMO/)


Run the application in `dev` profile.
```bash
./gradlew
```

Run the application in `dev` profile with the browser synchronization
```bash
yarn start
```

Open the website
```bash
open http://localhost:8080
```

Sign in as `admin` `admin` and browse the menu (including the API Swagger thru Swagger UI).
```bash
open http://localhost:8080
```


> Remark: you can directly generate the application with the entities 
```bash
mkdir -p ~/github/mastering-microservices/online-store
cd  ~/github/mastering-microservices/online-store
wget https://raw.githubusercontent.com/jhipster/jdl-samples/main/e-commerce-monolith.jdl
```

Edit `e-commerce-monolith.jdl` in order to change the database system (postgresql instead of mysql) and add properties (with regex patterns) to the `Product` entity.

```bash
jhipster import-jdl e-commerce-monolith.jdl
```

## Testing

### For the backend

```bash
cd  ~/github/mastering-microservices/online-store
./gradlew test
```

### For the frontend
```bash
yarn test
```

## End-to-End (e2e) testing

Term 1
```bash
cd  ~/github/mastering-microservices/online-store
./gradlew
```

Term 2
```bash
cd  ~/github/mastering-microservices/online-store
yarn e2e
```

## Code quality analysis (FAILED)

Launch the SonarQube container

```bash
cd  ~/github/mastering-microservices/online-store
docker-compose -f src/main/docker/sonar.yml up -d
docker-compose -f src/main/docker/sonar.yml logs -f
^C
```

> Remark: you should probably edit src/main/docker/sonar.yml for changing the version (3.9 --> 3.8)

When the container is up, launch the SonarQube analyser

```bash
./gradlew -Pprod clean sonarqube
```

Show the SonarQube report

```bash
open http://localhost:9001
open http://localhost:9001/dashboard?id=com.mycompany.store%3Astore
```

## CI/CD (UNDER TRANLATION)

Installez et lancez un serveur Jenkins
```bash
mkdir -p ~/github/mastering-microservices/jenkins
wget http://ftp-chi.osuosl.org/pub/jenkins/war-stable/2.150.1/jenkins.war
java -jar jenkins.war --httpPort=8989
```

Ouvrez la page de configuration du serveur Jenkins
```bash
open https://localhost:8989
```

Configurez le serveur Jenkins. Le clé admin se trouve dans la trace de la console de l'application Jenkins. Vous pouvez ajouter des addons comme [Blue Ocean](https://jenkins.io/projects/blueocean/), ...

Générez le pipeline Jenkinsfile pour le projet online-store
```bash
cd  ~/github/mastering-microservices/online-store
jhipster ci-cd
cat Jenkinsfile
```

Poussez le projet `online-store` vers un dépot Git (public ou privé) préalablement créé.
```bash
GITHUB_USERNAME=moncomptegithub
git remote add origin git@github.com:$GITHUB_USERNAME/online-store.git
git push -u origin master
```

Ajoutez le pipeline `Jenkinsfile` pour le projet `online-store`.

