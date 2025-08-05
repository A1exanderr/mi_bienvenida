#!/bin/bash
# deploy.sh
kubectl apply -f mi-bienvenida.yaml
kubectl apply -f ingress.yaml
echo "✅ App desplegada en http://bienvenida.local"
