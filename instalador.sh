#!/bin/bash

echo "🧩 Instalando herramientas..."
sudo apt update
sudo apt install -y curl git htop

echo "🔍 Verificando git..."
git --version

echo "🛠 Creando alias mihtop..."
echo "alias mihtop='htop'" >> ~/.bashrc
source ~/.bashrc

echo "✅ Listo. Usa 'mihtop' para abrir htop rápidamente."
