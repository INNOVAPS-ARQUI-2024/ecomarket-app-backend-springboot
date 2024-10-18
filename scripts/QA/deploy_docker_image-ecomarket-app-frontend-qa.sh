#!/bin/bash

# Variables
DOCKER_IMAGE_NAME="${DOCKERHUB_USERNAME}/ecomarket-app-frontend:qa"
CONTAINER_NAME="ecomarket-app-frontend-qa"
NETWORK_NAME="ecomarket-network"

# Iniciar sesión en Docker Hub (opcional, si el repositorio es privado)
echo "${DOCKERHUB_PASSWORD}" | docker login -u "${DOCKERHUB_USERNAME}" --password-stdin

# Detener y eliminar el contenedor anterior si existe
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Descargar la imagen desde Docker Hub
docker pull $DOCKER_IMAGE_NAME

# Ejecutar un nuevo contenedor
docker run -d --name $CONTAINER_NAME --network $NETWORK_NAME -p 80:80 $DOCKER_IMAGE_NAME

echo "Deployment ecomarket-app-frontend-qa completed successfully!"
