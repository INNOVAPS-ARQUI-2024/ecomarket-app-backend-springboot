#!/bin/bash

# Variables
DOCKER_IMAGE_NAME="devopsarqui2024/ecomarket-servicio-eureka:qa"
CONTAINER_NAME="ecomarket-servicio-eureka"
NETWORK_NAME="ecomarket-network"

# Detener y eliminar el contenedor anterior si existe
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Descargar la imagen desde Docker Hub
docker pull $DOCKER_IMAGE_NAME

# Ejecutar un nuevo contenedor en la red
docker run -d --name $CONTAINER_NAME --network $NETWORK_NAME -p 8761:8761 $DOCKER_IMAGE_NAME

echo "Deployment ecomarket-servicio-eureka completed successfully!"
