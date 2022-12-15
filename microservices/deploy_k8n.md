# Tutorial on Microservices Architecture with JHipster :: Deployment with Kubernetes

```bash
docker --version
kubectl version
```

Generate the Kubernetes descriptors
```bash
cd ~/github/mastering-microservices/
mkdir kubernetes && cd kubernetes
jhipster kubernetes
```

Answer to the questions:
```
? Which *type* of application would you like to deploy? Microservice application

? Enter the root directory where your gateway(s) and microservices are located 
../
4 applications found at /Users/donsez/github/mastering-microservices/

? Which applications do you want to include in your configuration? gateway, 
invoice, notification, productorder
? Do you want to setup monitoring for your applications ? Yes, for metrics only 
with Prometheus
? Which applications do you want to use with clustered databases (only available
 with MongoDB and Couchbase)? notification
JHipster registry detected as the service discovery and configuration provider used by your apps
? Enter the admin password used to secure the JHipster Registry admin
? What should we use for the Kubernetes namespace? store
? What should we use for the base Docker repository name? masteringmicroservice
? What command should we use for push Docker image to repository? docker push
? Do you want to enable Istio? No
? Choose the Kubernetes service type for your edge services LoadBalancer - Let a
 Kubernetes cloud provider automatically assign an IP
? Do you want to use dynamic storage provisioning for your stateful services? No
```

> Remark: You can use Google Container Registry for storing the containers images into a private registry. You should use the Docker registry gcr.io/YOUR_PROJECT_ID (gcr.io/tuto-store) in this exercice).

Have a look to the generated files
```bash
tree .
cat ./kubectl-apply.sh
```

Signin the public registry (hub.docker.com) or the private registry (gcr.io).
```bash
docker login
> Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
> Username: masteringmicroservice
> Password:
```

Push the images your public registry (hub.docker.com) or your private registry (GCP Container Registry https://console.cloud.google.com/gcr/images/tuto-store?project=tuto-store).

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

Create a cluster into the GCE region `europe-west1-b` https://console.cloud.google.com/kubernetes/list

![GCP Services](./gcp-k8s-services.png)


Launch the containers
```
gcloud container clusters get-credentials tuto-cluster --zone  europe-west1-b
```

```
./kubectl-apply.sh
```

Note the IP addresses on the components with 
```
kubectl get svc -n $APPID
```


Note the IP addresses on the gateway with
```
kubectl get svc gateway -n $APPID
```

```
NAME      TYPE           CLUSTER-IP      EXTERNAL-IP    PORT(S)          AGE
gateway   LoadBalancer   10.123.456.789   35.123.456.789   8080:32082/TCP   8h
```

Open the application (NB: the Angular frontend is served by the gateway):
```
open http://35.123.456.789:8080
```

Note the IP addresses on the console with

```
kubectl get svc jhipster-console -n $APPID
```

![GCP Console](./gcp-console.png)

More commands of kubectl https://kubernetes.io/docs/reference/kubectl/overview/

Expose the registry and note the external IP address with the following instructions

```
kubectl expose service jhipster-registry --type=NodePort --name=exposed-registry -n $APPID
kubectl get svc exposed-registry -n $APPID
kubectl scale statefulset jhipster-registry --replicas 2 -n $APPID
```

Replicate the registry
```
kubectl get svc exposed-registry -n $APPID
kubectl scale statefulset jhipster-registry --replicas 2 -n $APPID
kubectl get svc exposed-registry -n $APPID
```

