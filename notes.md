### Iniciar y Conectar
* `vagrant up --provider=qemu` → Inicia la máquina especificando QEMU como proveedor.
* `vagrant ssh` → Entra al box mediante SSH.
* `lsb_release -a` → *(Comando dentro de la máquina)* Verifica la versión del sistema operativo.

### Pausar y Reanudar
* `vagrant suspend` → Guarda el estado actual y suspende el box *(Nota: con QEMU puede no ser compatible)*.
* `vagrant resume` → Reanuda la máquina después de ser suspendida.
* `vagrant halt` → Detiene (apaga) la instancia de forma segura.

### Destruir y Limpiar
* `vagrant destroy` → Destruye la máquina virtual por completo, pero **no** elimina el archivo base (box) descargado.
* `vagrant box remove gyptazy/ubuntu22.04-arm64` → Elimina la imagen base (box) del almacenamiento de tu computadora.

### Aprovisionamiento (Scripts)
* `vagrant provision` → Si la máquina ya está en ejecución, fuerza la ejecución de los scripts de aprovisionamiento.
* `vagrant up --provision` → Inicia la máquina y fuerza el aprovisionamiento al arrancar.
* `vagrant reload --provision` -> El comando reinicia la máquina virtual y aplica la actualización del Vagrantfile
* `vagrant provision --provision-with reload-terramino` -> Reconstruir el backend y reiniciar los servicios para aplicar el cambio

# ALl info
kubectl get all

# App 1 (por host header)
curl -H "Host: app1.com" http://192.168.56.110

# App 2 (por host header)
curl -H "Host: app2.com" http://192.168.56.110

# App 3 (default backend, sin host específico)
curl http://192.168.56.110
curl -H "Host: app3.com" http://192.168.56.110