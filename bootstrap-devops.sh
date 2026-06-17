#!/bin/bash

echo "🚀 Preparando tu entorno DevOps..."

sudo apt update && sudo apt upgrade -y

echo "🔧 Instalando herramientas necesarias..."
sudo apt install -y git curl jq docker.io docker-compose

echo "👤 Añadiendo tu usuario al grupo docker..."
sudo usermod -aG docker $USER

echo "✅ Todo listo. Reinicia tu sesión para usar Docker sin sudo."
