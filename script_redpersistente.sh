#!/bin/bash

set -e

echo "🧠 [1/5] Cargando módulo br_netfilter..."
sudo modprobe br_netfilter

echo "✅ Verificando módulo cargado..."
if ! lsmod | grep -q br_netfilter; then
  echo "❌ Error: br_netfilter no pudo cargarse"
  exit 1
fi

echo "💾 [2/5] Haciendo el módulo persistente..."
echo 'br_netfilter' | sudo tee /etc/modules-load.d/k8s.conf > /dev/null

echo "⚙️ [3/5] Escribiendo configuración sysctl para Kubernetes..."
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf > /dev/null
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

echo "🔁 [4/5] Aplicando sysctl..."
sudo sysctl --system > /dev/null

echo "✅ [5/5] Confirmando valores aplicados:"
sysctl net.bridge.bridge-nf-call-iptables
sysctl net.bridge.bridge-nf-call-ip6tables
sysctl net.ipv4.ip_forward

echo "🎉 Configuración de red aplicada correctamente."
