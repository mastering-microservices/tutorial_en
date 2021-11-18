#!/bin/bash

# https://www.digitalocean.com/community/tutorials/how-to-use-nmap-to-scan-for-open-ports-on-your-vps

# sudo netstat -plunt

sudo apt-get update
sudo apt-get install nmap -y

# less /usr/share/nmap/nmap-services

# Liste de services qui doivent être filtrer en dehors de l'hôte

# 5432 Postgresql
INTERNAL_PORTS_LIST="5432"

# 3306 Mysql
INTERNAL_PORTS_LIST="$INTERNAL_PORTS_LIST 3306"

# 27017 Mongodb
INTERNAL_PORTS_LIST="$INTERNAL_PORTS_LIST 27017"

# 9090 Prometheus
INTERNAL_PORTS_LIST="$INTERNAL_PORTS_LIST 9090"

# 3000 Grafana
INTERNAL_PORTS_LIST="$INTERNAL_PORTS_LIST 3000"

# 8080 Spring
INTERNAL_PORTS_LIST="$INTERNAL_PORTS_LIST 8080"

 # 9080 9443 10990 Keycloak 
INTERNAL_PORTS_LIST="$INTERNAL_PORTS_LIST 9080 9443 10990"

# 9200 9300 Elastic
INTERNAL_PORTS_LIST="$INTERNAL_PORTS_LIST 9200 9300"

REMOTE_HOST=api.__MON_DOMAINE__.com

for port_number in $INTERNAL_PORTS_LIST
do
    echo "=================================================="
    echo "Testing port $port_number"
    echo "=================================================="

    sudo nmap -PN -p $port_number -sV $REMOTE_HOST
    #if [ ${?} -eq 0 ]; then
        #echo "=================================================="
        #echo "WARNING : Port $port_number should not be opened"
        #echo "==================================================";
    #fi
done

# sudo nmap -O $REMOTE_HOST
