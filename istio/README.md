# Tutorial on Microservices Architecture with JHipster :: Service Mesh with Istio


To enable Istio support:

* When asked `Do you want to configure Istio?`, choose one of the Istio options
* When asked `Do you want to generate Istio route files`, choose `Yes` to generate default configuration for circuit breaking, etc.

L'objectif de cette partie est la mise en place de microservices avec Istio.

Coming soon

```bash
mkdir -p ~/github/mastering-microservices/microservice-istio
cd ~/github/mastering-microservices/microservice-istio
wget https://raw.githubusercontent.com/jhipster/jdl-samples/main/microservice-ecommerce-store-istio-deployment.jdl
grep "Replace" microservice-ecommerce-store-istio-deployment.jdl
```

Edit microservice-ecommerce-store-istio-deployment.jdl

```bash
jhipster import-jdl microservice-ecommerce-store-istio-deployment.jdl
```

To be continued ...
