# Tutoriel sur les microservices avec JHipster :: Installation

## Installation JHipster
Suivez les instructions de https://www.jhipster.tech/installation/

### Java
```bash
scp -i ~/.ssh/xnet jdk-11.0.1_linux-x64_bin.deb tuto@host-1:~
```

### Nvm et Node
Suivez les instructions de https://github.com/creationix/nvm
```bash
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
nvm ls-remote
nvm install v8.11.3
nodejs --version
```

### Yeoman
```bash
npm install -g yo
yo --version
```

### JHipster Generator
```bash
npm install -g generator-jhipster@5.1.0
jhipster --version
# show all the subgenerators
```

## Docker CE
Suivez les instructions de https://docs.docker.com/install/ et https://docs.docker.com/compose/install/ pour `docker-compose`.

```bash
docker --version
docker-compose --version
```

## Heroku
Suivez les instructions de https://devcenter.heroku.com/articles/heroku-cli
```bash
curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
heroku --version
```

Testez votre compte créé sur Heroku via le lien https://signup.heroku.com/
```bash
heroku help
heroku login
heroku login -i
```

References:
 * https://devcenter.heroku.com/articles/heroku-cli-command

## Kubectl

Suivez les instructions de https://kubernetes.io/docs/tasks/tools/install-kubectl/

## Kubernetes (optionel)

Suivez les instructions de https://kubernetes.io/docs/setup/ en fonction de votre environnement.

## Google Cloud SDK
Suivez les instructions de https://cloud.google.com/sdk/docs/downloads-interactive
```bash
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
gcloud help
```

Testez votre compte créé sur Google Cloud Platform
```bash
gcloud init
```

## Rancher (optionel)
