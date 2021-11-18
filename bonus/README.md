# Tutoriel sur les microservices avec JHipster :: Bonus Track

## Plan
* [Sommaire](./README.md)
* [Installation](./install.md)
* [Création d'un monolithe](./monolith.md)
* [Création d'une architecture microservices](./microservice.md)
* [Service Mesh avec Istio](./istio.md)
* Bonus track

## Générer mvnw dans un projet Maven
```bash
chmod +x mvnw
~/devtools/apache-maven-X.X.X/bin/mvn -N io.takari:maven:wrapper
./mvnw
```

## Changer de version du generateur de JHipster
```bash
# Supérieur ou égal (dans la majeure) à 4.13.2
yarn global upgrade generator-jhipster@^4.13.2
jhipster --version

# Exactement 4.13.2
yarn global upgrade generator-jhipster@4.13.2
jhipster --version

# Supérieur ou égal (dans la majeure) à 5.7.0
yarn global upgrade generator-jhipster@^5.7.0
jhipster --version

# Exactement 5.1.0
yarn global upgrade generator-jhipster@5.1.0
jhipster --version
```

## Spring Eureka
Plusieurs exemples de clients Eureka (Java, Node.js)
* https://itnext.io/how-to-use-netflixs-eureka-and-spring-cloud-for-service-registry-8b43c8acdf4e
* https://github.com/paigen11/eureka-services-example
* https://spring.io/guides/gs/service-registration-and-discovery/
