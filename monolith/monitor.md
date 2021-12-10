

# Tutorial on microservices with JHipster :: Monitoring 

Read https://www.jhipster.tech/monitoring/

Edit `src/main/docker/monitoring.yml`if required

Launch the monitoring containers (`prometheus` and `grafana`)

```bash
docker-compose -f src/main/docker/monitoring.yml up -d
docker-compose -f src/main/docker/monitoring.yml ps
docker-compose -f src/main/docker/monitoring.yml logs -f
```

Open the Grafana console (sign in with `admin` `admin`)
```bash
open http://localhost:3000
```
