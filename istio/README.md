# Tutoriel sur les microservices avec JHipster :: Service Mesh avec Istio

L'objectif de cette partie est la mise en place de microservices avec Istio.

## Plan
* [Sommaire](./README.md)
* [Installation](./install.md)
* [Création d'un monolithe](./monolith.md)
* [Création d'une architecture microservices](./microservice.md)
* [Service Mesh avec Istio](./istio.md)
* [Bonus track](./bonus.md)

Coming soon

## Installation

### Minikube

```bash
brew cask install minikube
brew install kubernetes-cli
kubectl version
```

### Istio
Choissisez la distribution d'Istio qui convient à votre machine https://github.com/istio/istio/releases

```bash
./bin/istioctl version
./bin/istioctl help
```

## Lancement

```bash
minikube start --memory=4096 --disk-size=30g --kubernetes-version=v1.10.0
```

```bash

```


## Arrêt et nettoyage
```bash
minikube stop
minikube delete
```

## Références
* [Architectures Istio générées par JHipster](https://blog.ippon.fr/2018/11/21/architectures-istio-dans-jhipster/)
* [How to set up JHipster microservices with Istio service mesh on Kubernetes](https://medium.freecodecamp.org/jhipster-microservices-with-istio-service-mesh-on-kubernetes-a7d0158ba9a3)
* [Istio in action](https://www.manning.com/books/istio-in-action) [source code](https://github.com/istioinaction/book-source-code)
* Service mesh observability with https://www.kiali.io/
