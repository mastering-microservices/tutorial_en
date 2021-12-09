# Tutorial on Microservices Architecture with JHipster :: Deployment of the monolyth application with Google Cloud Platform (GCP)

Follow https://www.jhipster.tech/gcp/

Generate the file for GCP
```bash
jhipster gae
```

Choose a Google Cloud Project ID (`store-12345`)

```
Welcome to Google App Engine Generator

Installing App Engine Java SDK
... Running: gcloud components install app-engine-java --quiet
? Google Cloud Project ID store-12345
? In which Google App Engine location do you want to deploy ? europe-west1 - Belgium
? Google App Engine Service Name default
? Google App Engine Instance Class F1 - 600MHz, 256MB, Automatic Scaling
Instance Class "F1" can only be automatically scaled. Setting scaling type to automatic.
? How many instances minimum ? 1
? How many instances max (0 for unlimited) ? 2
? Use a Cloud SQL instance (Y/N) ? Y
API [sqladmin.googleapis.com] not enabled on project [908341469119]. Would you like to enable and retry (this will take a
 few minutes)? (y/N)? y 
```

Check the generated file
```bash
cat src/main/appengine/app.yaml
```

```bash
./gradlew appengineDeploy -Pgae -Pprod-gae
```

Open the GCP console
```bash
APPID=store-12345
open https://console.cloud.google.com/home/dashboard?project=$APPID
```

```bash
gcloud cheat-sheet
gcloud app regions list
gcloud info
```
