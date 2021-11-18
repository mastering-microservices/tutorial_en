# Tutoriel sur les microservices avec JHipster :: Démarrage avec un monolithe

## Lancement de l'injecteur de charge avec [Gatling](https://gatling.io/) (optionnel)

Suivez la section "Performance tests" de https://www.jhipster.tech/running-tests/

```bash
cd ~/github/mastering-microservices/
wget https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/2.3.1/gatling-charts-highcharts-bundle-2.3.1-bundle.zip
unzip gatling-charts-highcharts-bundle-2.3.1-bundle.zip
```bash

Lancez le recorder depuis un terminal
```bash
GATLING_HOME=~/github/mastering-microservices/gatling-charts-highcharts-bundle-2.3.1
cd ~/github/mastering-microservices/online-store
cd src/test/gatling
tree .
$GATLING_HOME/bin/recorder.sh

$GATLING_HOME/bin/gatling.sh
```

Lancez l'application à tester (de préférence, la version de production en modifiant auparavant les loggers positionnés en dessous de WARN).
```bash
cd  ~/github/mastering-microservices/online-store
docker-compose -f src/main/docker/app.yml up -d
docker-compose -f src/main/docker/app.yml logs -f
```

Lancez l'injecteur depuis un autre terminal. Répondez aux questions.
```bash
GATLING_HOME=~/github/mastering-microservices/gatling-charts-highcharts-bundle-2.3.1
cd  ~/github/mastering-microservices/online-store
cd src/test/gatling
$GATLING_HOME/bin/gatling.sh
```

Ouvrez le rapport HTML qui est généré dans le répertoire `$GATLING_HOME/results`.
