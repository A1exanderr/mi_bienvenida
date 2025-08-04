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


sudo kubeadm init --pod-network-cidr=10.244.0.0/16
#erro

# Activa temporalmente (hasta el siguiente reinicio):
sudo sysctl -w net.ipv4.ip_forward=1

# Lo vuelve permanente:
echo 'net.ipv4.ip_forward=1' | sudo tee -a /etc/sysctl.conf

# Aplica el cambio sin reiniciar:
sudo sysctl -p

cat /proc/sys/net/ipv4/ip_forward
#resultado es 1