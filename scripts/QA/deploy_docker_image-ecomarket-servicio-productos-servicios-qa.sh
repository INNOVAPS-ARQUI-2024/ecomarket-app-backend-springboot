#!/bin/bash

# Variables
DOCKER_IMAGE_NAME="ecomarket-servicio-productos-servicios:qa"
CONTAINER_NAME="ecomarket-servicio-productos-servicios-qa"
NETWORK_NAME="ecomarket-network"

# Detener y eliminar el contenedor anterior si existe
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Descargar la imagen desde Docker Hub
docker pull $DOCKER_IMAGE_NAME

# Ejecutar un nuevo contenedor
docker run -d --name $CONTAINER_NAME --network $NETWORK_NAME $DOCKER_IMAGE_NAME -p 8080:8080 $DOCKER_IMAGE_NAME

echo "Deployment ecomarket-servicio-productos-servicios completed successfully!"
