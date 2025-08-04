#!/bin/bash
#varateristicas del servidor
#===============
servidor 1
1 procesador
2048M ram
ip: 10.1.2.234
#===============
Servidor 2
2 procesador
2048M ram
ip: 10.1.2.238
#===============

#================================
Servidor1
Numero de usuarios es 2500
en un segundo 
ilimitado
#===============================
Servidor1
Numero de usuarios es 5000
en un segundo 
ilimitado
#===============================
#===============================
#===============================
#================MONITOR DE RECURSOS DEL SERVIDOR===============
top            # Uso general del sistema
htop           # Vista avanzada del uso de CPU/RAM
vmstat         # Estadísticas de memoria, swap, CPU
iostat         # Uso de disco
netstat        # Conexiones de red
dstat          # Estadísticas combinadas
#sudo apt install htop
#===============================================================


# Desactivar swap
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab


sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /usr/share/keyrings/kubernetes-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl



sudo apt install -y containerd
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
sudo systemctl restart containerd
sudo systemctl enable containerd

#sudo apt install -y cri-tools


#sudo kubeadm init --pod-network-cidr=10.244.0.0/16
sudo kubeadm init   --apiserver-advertise-address=10.1.2.240   --pod-network-cidr=10.244.0.0/16   --ignore-preflight-errors=NumCPU
#erro

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config




# Activa temporalmente (hasta el siguiente reinicio):
sudo sysctl -w net.ipv4.ip_forward=1

# Lo vuelve permanente:
echo 'net.ipv4.ip_forward=1' | sudo tee -a /etc/sysctl.conf

# Aplica el cambio sin reiniciar:
sudo sysctl -p

cat /proc/sys/net/ipv4/ip_forward
#resultado es 1


kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl get pods -n kube-system -o wide
kubectl get nodes
kubectl get pods -n kube-system -o wide | grep flannel
kubectl logs -n kube-system -l app=flannel
kubectl get nodes

#en kuber 1 ejecutar para unir los dos nodos
kubeadm token create --print-join-command
#el resultado Copia ese comando y pégalo en kuber2 como sudo


#en kuber uno verifica 
kubectl get nodes
#y te tiene que salir asi 
#NAME     STATUS   ROLES           AGE     VERSION
#kuber1   Ready    control-plane   20m     v1.30.14
#kuber2   Ready    <none>          30s     v1.30.14