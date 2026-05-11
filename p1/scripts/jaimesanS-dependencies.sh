

curl -sfL https://get.k3s.io | sh -s - server --node-ip 192.168.56.110

mkdir -p /home/vagrant/.kube
sudo cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config
sudo chown vagrant:vagrant /home/vagrant/.kube/config

echo ">>> Esperando a que el token se genere..."
while [ ! -f /var/lib/rancher/k3s/server/node-token ]; do
  sleep 2
done

echo ">>> Copiando token a la carpeta compartida..."
sudo cp /var/lib/rancher/k3s/server/node-token /vagrant/token