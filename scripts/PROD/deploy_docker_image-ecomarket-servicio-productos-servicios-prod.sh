#!/bin/bash

# Variables (puedes personalizarlas o recibirlas como parámetros)
DOCKER_IMAGE_PATH="/tmp/ecomarket-servicio-productos-servicios-prod.tar"
DOCKER_IMAGE_NAME="ecomarket-servicio-productos-servicios:prod"
CONTAINER_NAME="ecomarket-servicio-productos-servicios-prod"

# Cargar la imagen Docker
docker load -i $DOCKER_IMAGE_PATH

# Detener y eliminar el contenedor anterior si existe
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Ejecutar un nuevo contenedor
docker run -d --name $CONTAINER_NAME -p 8080:8080 $DOCKER_IMAGE_NAME

# Opcional: eliminar el archivo .tar para ahorrar espacio
rm $DOCKER_IMAGE_PATH

echo "Deployment ecomarket-servicio-productos-servicios-prod completed successfully!"

