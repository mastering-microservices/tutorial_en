# Tutoriel sur les microservices avec JHipster :: Microservices

## Deploiement avec Kubernetes

```bash
docker --version
kubectl version
```

Générez les descripteurs de déploiement Kubernetes
```bash
cd ~/github/mastering-microservices/
mkdir kubernetes && cd kubernetes
jhipster kubernetes
```
Répondez aux questions suivantes:
```
? Which *type* of application would you like to deploy? Microservice application
? Enter the root directory where your gateway(s) and microservices are located ../
3 applications found at ~/github/mastering-microservices/
? Which applications do you want to include in your configuration? gateway, invo
ice, notification
? Do you want to setup monitoring for your applications ? Yes, for logs and metr
ics with the JHipster Console (based on ELK and Zipkin)
? Which applications do you want to use with clustered databases (only available with MongoDB and Couchbase)? notification
JHipster registry detected as the service discovery and configuration provider used by your apps
? Enter the admin password used to secure the JHipster Registry admin
? What should we use for the Kubernetes namespace? store
? What should we use for the base Docker repository name? masteringmicroservice
? What command should we use for push Docker image to repository? docker push
? Do you want to configure Istio? Not required
? Choose the kubernetes service type for your edge services LoadBalancer - Let a kubernetes cloud provider automatically assign an IP
```

> Remarque: Si vous souhaitez utiliser Google Container Registry pour héberger des images de conteneur dans un registre privé, vous devrez utiliser pour le nom de base du référentiel Docker défini sur gcr.io/YOUR_PROJECT_ID (gcr.io/tuto-store dans cet exercice).

Jetez un coup d'oeil aux fichier générés
```bash
tree .
cat ./kubectl-apply.sh
```

Loggez vous sur votre dépôt public (hub.docker.com) or privé (gcr.io).
```bash
docker login
> Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
> Username: masteringmicroservice
> Password:
```

Poussez les images vers votre dépôt public (hub.docker.com) or privé (Container Registry de GCP https://console.cloud.google.com/gcr/images/tuto-store?project=tuto-store).

```
REPO=masteringmicroservice

push_image(){
  CONTAINER=$1
  docker image tag $CONTAINER $REPO/$CONTAINER
  docker images | grep $CONTAINER
  docker push $REPO/$CONTAINER
}

push_image gateway
push_image invoice
push_image productorder
push_image notification

open https://hub.docker.com/r/$REPO/
```

Créez un cluster dans la zone europe-west1-b de GCE depuis https://console.cloud.google.com/kubernetes/list

![GCP Services](./gcp-k8s-services.png)


Lancez les containers sur le cluster
```
gcloud container clusters get-credentials tuto-cluster --zone  europe-west1-b
```

```
./kubectl-apply.sh
```

Repérez les adresses IP des composants avec
```
kubectl get svc -n tuto-store
```


Repérez l'adresse IP externe de la gateway avec
```
kubectl get svc gateway -n tuto-store
```
```
NAME      TYPE           CLUSTER-IP      EXTERNAL-IP    PORT(S)          AGE
gateway   LoadBalancer   10.123.456.789   35.123.456.789   8080:32082/TCP   8h
```

Ouvrez la page du service store (le frontend Angular est livré sur la gateway):
```
open http://35.123.456.789:8080
```

Repérez l'adresse IP externe de la console avec
```
kubectl get svc jhipster-console -n tuto-store
```


![GCP Console](./gcp-console.png)

Plus de commandes kubectl https://kubernetes.io/docs/reference/kubectl/overview/

Exposez le registre et repérez l'adresse IP externe de le registre avec les instructions suivantes
```
kubectl expose service jhipster-registry --type=NodePort --name=exposed-registry -n tuto-store
kubectl get svc exposed-registry -n tuto-store
kubectl scale statefulset jhipster-registry --replicas 2 -n tuto-store
```

Répliquez le registre exposé
```
kubectl get svc exposed-registry -n tuto-store
kubectl scale statefulset jhipster-registry --replicas 2 -n tuto-store
kubectl get svc exposed-registry -n tuto-store
```
