#!/bin/bash
echo "í±€ Monitoreando HPA, Pods y Recursos..."

# Ventana 1: HPA
echo "í³ˆ HPA (escalado automÃ¡tico):"
kubectl get hpa -w &
HPA_PID=$!

# Ventana 2: Pods
echo "_Pods (rÃ©plicas):"
kubectl get pods -w &
PODS_PID=$!

# Ventana 3: Uso de recursos
echo "í³Š Uso de CPU y memoria:"
watch kubectl top pods

# Limpiar al final
kill $HPA_PID $PODS_PID 2>/dev/null
