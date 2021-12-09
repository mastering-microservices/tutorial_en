

# Tutorial on microservices with JHipster :: Monitoring 

Launch the monitoring containers

```bash
docker-compose -f src/main/docker/monitoring.yml up -d
docker-compose -f src/main/docker/monitoring.yml logs -f
```

Open the Grafana console (login is `admin` `admin`)
```bash
open http://localhost:3000
```
