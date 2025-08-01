#!/bin/bash
echo "� Uniendo nodo WORKER (10.1.2.238) al clúster"

# === Reemplaza con tu token real ===
MASTER_IP="10.1.2.234"
TOKEN="K10abcdef...::server:1234567890"  # ← CAMBIA ESTO

# === Instalar k3s como worker ===
curl -sfL https://get.k3s.io | \
K3S_URL=https://$MASTER_IP:6443 \
K3S_TOKEN=$TOKEN \
sh -

# === Esperar y verificar ===
sleep 10
echo "✅ Worker unido. Verifica en el master con: kubectl get nodes"
