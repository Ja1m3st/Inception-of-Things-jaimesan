#!/bin/bash

echo "Creating cluster..."
k3d cluster create mycluster -p "8888:8888@loadbalancer"

echo "Creating namespaces..."
kubectl create namespace gitlab
kubectl create namespace argocd
kubectl create namespace dev

helm repo add gitlab https://charts.gitlab.io/
helm repo update
helm upgrade --install gitlab gitlab/gitlab -n gitlab -f confs/gitlab-values.yaml
kubectl get secret gitlab-gitlab-initial-root-password -n gitlab -o jsonpath="{.data.password}" | base64 -d; echo
kubectl port-forward svc/traefik -n kube-system 8080:80

#Argo
kubectl apply -n argocd --server-side --force-conflicts -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl wait --for=condition=Available deployment/argocd-server -n argocd --timeout=300s
while ! kubectl get secret argocd-initial-admin-secret -n argocd &> /dev/null; do
    sleep 2
done
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
kubectl port-forward svc/argocd-server -n argocd 9090:443
