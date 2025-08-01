#!/bin/bash
echo "� Monitoreando HPA, Pods y Recursos..."

# Ventana 1: HPA
echo "� HPA (escalado automático):"
kubectl get hpa -w &
HPA_PID=$!

# Ventana 2: Pods
echo "_Pods (réplicas):"
kubectl get pods -w &
PODS_PID=$!

# Ventana 3: Uso de recursos
echo "� Uso de CPU y memoria:"
watch kubectl top pods

# Limpiar al final
kill $HPA_PID $PODS_PID 2>/dev/null
