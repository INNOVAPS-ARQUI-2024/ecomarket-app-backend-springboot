#!/bin/bash

# Variables
DOCKER_IMAGE_PATH="/tmp/ecomarket-app-frontend-qa.tar"
DOCKER_IMAGE_NAME="ecomarket-app-frontend:qa"
CONTAINER_NAME="ecomarket-app-frontend-qa"

# Cargar la imagen Docker
docker load -i $DOCKER_IMAGE_PATH

# Detener y eliminar el contenedor anterior si existe
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Ejecutar un nuevo contenedor
docker run -d --name $CONTAINER_NAME -p 80:80 $DOCKER_IMAGE_NAME

# Opcional: eliminar el archivo .tar para ahorrar espacio
rm $DOCKER_IMAGE_PATH

echo "Deployment ecomarket-app-frontend-qa completed successfully!"

