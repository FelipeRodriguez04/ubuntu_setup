#!/bin/bash

# Actualizar paquetes
echo "Actualizando paquetes..."
sudo apt update && sudo apt upgrade -y

# Instalar dependencias básicas
echo "Instalando dependencias básicas..."
sudo apt install -y curl git unzip wget

# Instalar Flutter
echo "Instalando Flutter..."
sudo apt install -y clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev
mkdir -p ~/development && cd ~/development
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.3-stable.tar.xz
sudo tar -xf flutter_linux_3.16.3-stable.tar.xz
export PATH="$HOME/development/flutter/bin:$PATH"
echo "Flutter versión instalada:"
flutter --version

# Instalar Node.js y Express
echo "Instalando Node.js y Express..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
echo "Node.js versión instalada:"
node -v
echo "npm versión instalada:"
npm -v

# Crear y configurar el proyecto backend
echo "Configurando backend..."
mkdir -p ~/backend && cd ~/backend
npm init -y
npm install express dotenv jsonwebtoken bcryptjs cors body-parser mysql2

# Verificar instalación de Express
echo "Express versión instalada:"
npm list express

# Instalar MySQL Server
echo "Instalando MySQL Server..."
sudo apt install -y mysql-server
sudo systemctl start mysql
sudo systemctl enable mysql
echo "MySQL versión instalada:"
mysql --version

# Configurar MySQL (crear base de datos y usuario)
echo "Configurando MySQL..."
sudo mysql -e "CREATE DATABASE citas_db;"
sudo mysql -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin123';"
sudo mysql -e "GRANT ALL PRIVILEGES ON citas_db.* TO 'admin'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Instalar PayPal SDK
echo "Instalando PayPal SDK..."
npm install paypal-rest-sdk

# Instalar Zoom SDK
echo "Instalando Zoom API SDK..."
npm install @zoomus/websdk

# Verificar instalación de dependencias de Node.js
echo "Verificando dependencias de Node.js instaladas:"
npm list paypal-rest-sdk @zoomus/websdk

# Configuración final
echo "Instalación y configuración completadas."
