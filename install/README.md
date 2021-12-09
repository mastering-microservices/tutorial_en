# Tutorial on Microservices Architecture with JHipster :: Installation

## JHipster Installation 
Follow the instructions: https://www.jhipster.tech/installation/

### Java
```bash
scp -i ~/.ssh/xnet jdk-11.0.1_linux-x64_bin.deb tuto@host-1:~
```

### Nvm et Node
Follow the instructions: https://github.com/creationix/nvm
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
Follow the instructions https://docs.docker.com/install/ and https://docs.docker.com/compose/install/ for `docker-compose`.

```bash
docker --version
docker-compose --version
```

## Heroku
Follow the instructions: https://devcenter.heroku.com/articles/heroku-cli
```bash
curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
heroku --version
```

Check your Heroku account thru https://signup.heroku.com/
```bash
heroku help
heroku login
heroku login -i
```

References:
 * https://devcenter.heroku.com/articles/heroku-cli-command

## Kubectl

Follow the instructions https://kubernetes.io/docs/tasks/tools/install-kubectl/

## Kubernetes (optionel)

Follow the instructions https://kubernetes.io/docs/setup/ according to your environnement.

## Google Cloud SDK
Follow the instructions https://cloud.google.com/sdk/docs/downloads-interactive
```bash
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
gcloud help
```

Check your Google Cloud Platform account
```bash
gcloud init
```
