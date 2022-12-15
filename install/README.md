# Tutorial on Microservices Architecture with JHipster :: Installation

## Working directory
```bash
mkdir -p ~/github/mastering-microservices
cd ~/github/mastering-microservices
# git clone https://github.com/mastering-microservices/tutorial_en.git
git clone git@github.com:mastering-microservices/tutorial_en.git
```

## JHipster Installation 
Follow the instructions: https://www.jhipster.tech/installation/

### JDK (AdoptOpenJDK)
Download and install the latest LTS (Long Term Support) release of [AdoptOpenJDK](https://adoptopenjdk.net/releases.html) for your system.

> `jdk-11.0.17+8` is the latest LTS at Dec 15, 2022

```bash
cd ~/Downloads
wget https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.17%2B8/OpenJDK11U-jdk_x64_linux_hotspot_11.0.17_8.tar.gz
tar xzf OpenJDK11U-jdk_x64_linux_hotspot_11.0.17_8.tar.gz
export PATH=$PWD/jdk-11.0.17+8/bin:$PATH
java -version
```

```
openjdk version "11.0.17" 2022-10-25
OpenJDK Runtime Environment Temurin-11.0.17+8 (build 11.0.17+8)
OpenJDK 64-Bit Server VM Temurin-11.0.17+8 (build 11.0.17+8, mixed mode)
```

Add `export PATH=$PWD/jdk-11.0.17+8/bin:$PATH` to `.bashrc`


### Nvm et Node

Follow the instructions: https://github.com/creationix/nvm

Install `npm`
```bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
```

Install the latest LTS of NodeJS (and `npm`)
```bash
nvm ls-remote
nvm install v18.12.1
nvm ls
nvm use v18.12.1
nodejs --version
```

### Cloc (Count Lines of Code)

```bash
npm install -g cloc
```

### Yeoman

```bash
npm install -g yo
yo --version
```

### JHipster Generator

```bash
npm install -g generator-jhipster
jhipster --version
# show all the subgenerators
```

```
INFO! Using bundled JHipster
7.9.3
```

> 7.9.3 (Dec. 15, 2022) 

## Docker CE

Install Docker CE + Docker Compose or Docker Desktop on your system.

Follow the instructions https://docs.docker.com/install/ and https://docs.docker.com/compose/install/ for `docker-compose`.

```bash
docker --version
docker-compose --version
docker compose --version
```

## Heroku
Get your Heroku credits with your [Github Student Developer Pack](https://blog.heroku.com/github-student-developer-program).

Follow the instructions: https://devcenter.heroku.com/articles/heroku-cli
```bash
sudo snap install --classic heroku
# curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
heroku --version
heroku help
```

Check your Heroku account thru https://signup.heroku.com/

Browser mode:
```bash
heroku login
```

CLI mode:
```bash
heroku login -i
```

```bash
heroku apps
heroku plugins
heroku logs
```

References:
 * https://devcenter.heroku.com/articles/heroku-cli-command

## Kubectl

Follow the instructions https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

```bash
kubectl version --client
```

## Google Cloud SDK

Follow the instructions https://cloud.google.com/sdk/docs/downloads-interactive
```bash
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
gcloud --version
```

At Dec 15, 2022.
````
Google Cloud SDK 411.0.0
bq 2.0.83
core 2022.12.05
gcloud-crc32c 1.0.0
gsutil 5.17
```


Check your Google Cloud Platform account
```bash
gcloud init
```

Sometime, we need:
```bash
source .bashrc 
gcloud --help
```
