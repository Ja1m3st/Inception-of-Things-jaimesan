#!/bin/bash

echo ">>> Esperando a que el Server genere el token..."
while [ ! -s /vagrant/token ]; do 
  sleep 2
done

echo ">>> Token encontrado. Leyendo token..."
TOKEN=$(cat /vagrant/token)

echo ">>> Instalando K3s Agent..."
curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=$TOKEN sh -s - --node-ip 192.168.56.111
