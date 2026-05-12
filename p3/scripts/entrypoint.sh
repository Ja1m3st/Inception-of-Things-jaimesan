k3d cluster create mycluster -p "8888:8888@loadbalancer"
kubectl create namespace argocd
kubectl create namespace dev
kubectl apply -n argocd --server-side --force-conflicts -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
igHIgtXxEuEejetX
kubectl port-forward svc/argocd-server -n argocd 8080:443