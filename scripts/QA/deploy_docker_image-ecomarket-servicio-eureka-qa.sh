#!/bin/bash

# Variables
DOCKER_IMAGE_PATH="/tmp/ecomarket-servicio-eureka-qa.tar"
DOCKER_IMAGE_NAME="ecomarket-servicio-eureka:qa"
CONTAINER_NAME="ecomarket-servicio-eureka-qa"
NETWORK_NAME="ecomarket-network"

# Cargar la imagen Docker
docker load -i $DOCKER_IMAGE_PATH

# Detener y eliminar el contenedor anterior si existe
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Ejecutar un nuevo contenedor en la red
docker run -d --name $CONTAINER_NAME --network $NETWORK_NAME -p 8761:8761 $DOCKER_IMAGE_NAME

# Opcional: eliminar el archivo .tar para ahorrar espacio
rm $DOCKER_IMAGE_PATH

echo "Deployment ecomarket-servicio-eureka-qa completed successfully!"
