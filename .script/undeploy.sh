#!/bin/bash

echo "�️  Eliminando tu aplicación de Kubernetes..."

kubectl delete -f ingress.yaml
kubectl delete -f mi-bienvenida.yaml

echo "✅ ¡Aplicación eliminada!"
