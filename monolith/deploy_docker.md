# Tutorial on Microservices Architecture with JHipster :: Deployment of the monolyth application with Docker

## Build the Docker image (`prod` profile)

Build the image
```bash
./gradlew bootJar -Pprod jibDockerBuild
docker images | grep store
```

## Deploy locally the application with Docker

Launch the composition containing the application (`store-app`) et the datastore (`store-postgresql`).
```bash
docker-compose -f src/main/docker/app.yml up -d
```

Show the containers' logs
```bash
docker-compose -f src/main/docker/app.yml logs -f
```

Open the application
```bash
open http://localhost:8080
```

Stop the `store` service
```bash
docker-compose -f src/main/docker/app.yml stop store
```

Restart the `store` service
```bash
docker-compose -f src/main/docker/app.yml start store
```

Stop the `store-postgresql` service
```bash
docker-compose -f src/main/docker/app.yml stop store-postgresql
```
> What's happen ?

Restart the `store-postgresql` service
```bash
docker-compose -f src/main/docker/app.yml start store-postgresql
```
> What's happen ?

Destroy the composition.

```bash
docker-compose -f src/main/docker/app.yml down
```

> Remark : data in the `store-postgresql` service are definitively lost.
