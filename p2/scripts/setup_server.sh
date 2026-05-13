#!/bin/bash

echo ">>> Install K3s in server mode"
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig-mode 644" sh -s -

echo ">>> Wait for kubectl to be ready"
sleep 10

echo ">>> Alias ​​useful for evaluation"
echo "alias k='kubectl'" >> /home/vagrant/.bashrc


kubectl apply -f /vagrant/confs/app1.yaml
kubectl apply -f /vagrant/confs/app2.yaml
kubectl apply -f /vagrant/confs/app3.yaml
kubectl apply -f /vagrant/confs/ingress.yaml