#!/bin/bash

echo "Subindo o container..."
docker-compose up -d --remove-orphans

sleep 5

echo "Definindo permissoes das pastas de volumes..."
docker container exec vue-sales bash -c "chmod 777 -R /usr/src/app"
sleep 1

echo "Iniciando o app..."
docker container exec vue-sales bash -c "cd /usr/src/app; npm i; npm start"
sleep 1

echo "Concluido!"
