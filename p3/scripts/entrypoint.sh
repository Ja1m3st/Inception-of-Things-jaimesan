echo "Creating cluster..."
k3d cluster create mycluster -p "8888:8888@loadbalancer"

echo "Creating namespaces..."
kubectl create namespace argocd
kubectl create namespace dev

echo "Installing Argo CD..."
kubectl apply -n argocd --server-side --force-conflicts -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "Waiting for Argo CD to fully start (this may take a couple of minutes)..."
kubectl wait --for=condition=Available deployment/argocd-server -n argocd --timeout=300s

echo "Waiting for the password to be generated..."
while ! kubectl get secret argocd-initial-admin-secret -n argocd &> /dev/null; do
    sleep 2
done

echo "Argo CD is ready! Your administrator password is:"
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
echo ""

echo "Starting Argo CD"
kubectl port-forward svc/argocd-server -n argocd 8080:443