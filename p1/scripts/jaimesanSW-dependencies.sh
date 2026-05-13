#!/bin/bash

echo ">>> Waiting for the server to generate the token..."
while [ ! -s /vagrant/token ]; do 
  sleep 2
done

echo ">>> Token found. Reading token..."
TOKEN=$(cat /vagrant/token)

echo ">>> Installing K3s Agent..."
curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=$TOKEN sh -s - --node-ip 192.168.56.111
