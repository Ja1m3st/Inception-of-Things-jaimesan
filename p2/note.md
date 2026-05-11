# ALl info
kubectl get all

# App 1 (por host header)
curl -H "Host: app1.com" http://192.168.56.110

# App 2 (por host header)
curl -H "Host: app2.com" http://192.168.56.110

# App 3 (default backend, sin host específico)
curl http://192.168.56.110
curl -H "Host: app3.com" http://192.168.56.110