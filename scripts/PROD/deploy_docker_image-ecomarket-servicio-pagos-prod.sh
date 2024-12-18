#!/bin/bash

# Variables
DOCKER_IMAGE_NAME="devopsarqui2024/ecomarket-servicio-pagos:prod"
CONTAINER_NAME="ecomarket-servicio-pagos"
NETWORK_NAME="ecomarket-network"

# Detener y eliminar el contenedor anterior si existe
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Descargar la imagen desde Docker Hub
docker pull $DOCKER_IMAGE_NAME

# Ejecutar un nuevo contenedor
docker run -d --name $CONTAINER_NAME --network $NETWORK_NAME -p 8081:8081 $DOCKER_IMAGE_NAME

echo "Deployment ecomarket-servicio-pagos completed successfully!"
