#!/bin/bash
 
sudo docker image rm -f  keycloak-with-rabbitmp-keycloak-2 # this is for deleting old images if any changes have been made, disable this if there is no changes in this service.
sudo docker image rm -f  keycloak-with-rabbitmp-receiver-service # this is for deleting old images if any changes have been made, disable this if there is no changes in this service.
# mvn clean install
sudo docker compose up
