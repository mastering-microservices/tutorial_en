# Tutoriel sur les microservices avec JHipster :: Démarrage avec un monolithe (version courte avec Maven et Postgres)

## Recupération des fichiers
```bash
mkdir -p ~/github/mastering-microservices/
git clone https://github.com/mastering-microservices/tutorial.git
```

## Création de l'application de base
```bash
mkdir -p ~/github/mastering-microservices/online-store
cd  ~/github/mastering-microservices/online-store
jhipster
```
```
? Which *type* of application would you like to create? Monolithic application (recommended for simple projects)
? What is the base name of your application? storeNOMPRENOM
? What is your default Java package name? com.VOTRE_NOM_PRENOM.store
? Do you want to use the JHipster Registry to configure, monitor and scale your application? No
? Which *type* of authentication would you like to use? JWT authentication (stateless, with a token)
? Which *type* of database would you like to use? SQL (H2, MySQL, MariaDB, PostgreSQL, Oracle, MSSQL)
? Which *production* database would you like to use? PostgreSQL
? Which *development* database would you like to use? H2 with disk-based persistence
? Do you want to use the Spring cache abstraction? Yes, with the Ehcache implementation (local cache, for a single node)
? Do you want to use Hibernate 2nd level cache? Yes
? Would you like to use Maven or Gradle for building the backend? Maven
? Which other technologies would you like to use?
? Which *Framework* would you like to use for the client? Angular X
? Would you like to enable *SASS* support using the LibSass stylesheet preprocessor? Yes
? Would you like to enable internationalization support? Yes
? Please choose the native language of the application English
? Please choose additional languages to install French
? Besides JUnit and Jest, which testing frameworks would you like to use? Gatling, Cucumber, Protractor
? Would you like to install other generators from the JHipster Marketplace? Yes
? Which other modules would you like to use? (generator-jhipster-docker-2.5.0) Additional Docker support: Docker Hub, Local SMTP Server, NGinx, (generator-jhipster-swagger-cli-3.0.1) JHipster module to generate swagger client code from a swagger definition
```

> Remarque: Jetez un coup d'oeil aux sous-générateurs disponibles (tous ne sont pas compatibles avec la version courante de JHipster ou bien avec le frontend choisi). https://www.jhipster.tech/modules/marketplace/#/list

Lancez l'application en profil `dev`.
```bash
./mvnw
```

Loggez vous en utilisateur `admin` `admin` et parcourez les différents sous-menus d'administration (dont l'API Swagger via Swagger UI).
```bash
open http://localhost:8080
```

## Génération des entités de l'application store

Visualisez le [schéma du service monolithique](./online-store.jh) avec le [JDL Studio](https://start.jhipster.tech/jdl-studio/). L'image est [ici](./online-store.jh.png).

Générez les sources (frontend et backend) relatives aux entités et à leurs relations.
```bash
cd  ~/github/mastering-microservices/online-store
jhipster import-jdl ../tutorial/online-store.jh
```

Lancez l'application en profil `dev`.
```bash
./mvnw
```

Ouvrez l'application dans un browser avec le rafraissement automatique en cas de modification des sources du frontend
```bash
yarn start
```

Ouvrez l'application dans un browser
```bash
open http://localhost:8080
```

Loggez vous en utilisateur `admin` `admin` et parcourez l'API Swagger (A)
```bash
open http://localhost:8080
```

## Lancement des tests générés

### Pour le backend

```bash
cd  ~/github/mastering-microservices/online-store
./mvnw test
```

### Pour le frontend
```bash
yarn test
```

Pour les tests end-to-end, lancez le backend depuis un terminal
```bash
cd  ~/github/mastering-microservices/online-store
./mvnw
```

Depuis un autre terminal, lancez le test e2e
```bash
cd  ~/github/mastering-microservices/online-store
yarn e2e
```

## Analyse de la qualité du code
Lancez un container SonarQube
```bash
cd  ~/github/mastering-microservices/online-store
docker-compose -f src/main/docker/sonar.yml up -d
docker-compose -f src/main/docker/sonar.yml logs -f
^C
```
Attendez qu'il soit démarré et prêt au service.

Lancez l'analyseur SonarQube
```bash
./mvnw sonarqube
```

Visualisez le rapport de l'analyseur SonarQube
```bash
open http://localhost:9000
open http://localhost:9000/dashboard?id=com.VOTRE_NOM_PRENOM.store
```

## Mise en place du CI/CD

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

