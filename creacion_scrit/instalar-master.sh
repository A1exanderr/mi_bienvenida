#!/bin/bash
echo "Ì∫Ä Iniciando instalaci√≥n en el MASTER (10.1.2.234)"

# === 1. Instalar k3s master ===
echo "Ì¥ß Instalando k3s (master)..."
curl -sfL https://get.k3s.io | sh -

# Esperar a que se inicie
sleep 10

# === 2. Mostrar token para el worker ===
echo "Ì¥ë Token para unir el worker:"
sudo cat /var/lib/rancher/k3s/server/node-token
echo ""

# === 3. Ir al directorio de tu app ===
cd /home/alkey/mi_bienvenida || { echo "‚ùå Carpeta mi_bienvenida no encontrada"; exit 1; }

# === 4. Construir imagen Docker con nerdctl ===
echo "Ì≥¶ Construyendo imagen Docker..."
sudo nerdctl build -t mi-bienvenida:v1 . --quiet

# Verificar
sudo nerdctl images | grep mi-bienvenida

# === 5. Crear despliegue YAML ===
echo "Ì≥ù Creando despliegue.yaml..."
cat <<EOF > /home/alkey/despliegue.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: bienvenida-deployment
  labels:
    app: bienvenida
spec:
  replicas: 2
  selector:
    matchLabels:
      app: bienvenida
  template:
    metadata:
      labels:
        app: bienvenida
    spec:
      containers:
      - name: nginx
        image: mi-bienvenida:v1
        ports:
        - containerPort: 80
        resources:
          requests:
            memory: "100Mi"
            cpu: "100m"
          limits:
            memory: "200Mi"
            cpu: "200m"
---
apiVersion: v1
kind: Service
metadata:
  name: bienvenida-service
spec:
  type: NodePort
  ports:
  - port: 80
    targetPort: 80
    nodePort: 30080
  selector:
    app: bienvenida
EOF

# === 6. Aplicar despliegue ===
echo "Ì∫Ä Aplicando despliegue..."
sudo kubectl apply -f /home/alkey/despliegue.yaml

# === 7. Instalar Metrics Server ===
echo "Ì≥ä Instalando Metrics Server..."
sudo kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

# Esperar
sleep 15

# === 8. Crear HPA (escalado autom√°tico) ===
echo "Ì¥Ñ Creando HPA para escalado autom√°tico..."
cat <<EOF > /home/alkey/hpa.yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: bienvenida-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: bienvenida-deployment
  minReplicas: 2
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70
EOF

sudo kubectl apply -f /home/alkey/hpa.yaml

# === 9. Mostrar estado ===
echo "‚úÖ Estado actual:"
sudo kubectl get nodes
sudo kubectl get pods
sudo kubectl get hpa

echo "Ìæâ MASTER listo. Ahora instala el worker con el token mostrado arriba."
