#!/bin/bash

echo ">>> Instalar K3s en modo server"
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig-mode 644" sh -s -

echo ">>> Esperar a que kubectl esté listo"
sleep 10

echo ">>> Alias útil para la evaluación"
echo "alias k='kubectl'" >> /home/vagrant/.bashrc


kubectl apply -f /vagrant/confs/app1.yaml
kubectl apply -f /vagrant/confs/app2.yaml
kubectl apply -f /vagrant/confs/app3.yaml
kubectl apply -f /vagrant/confs/ingress.yaml