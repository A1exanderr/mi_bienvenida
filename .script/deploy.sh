#!/bin/bash

# Script de despliegue automático para tu app
echo "� Desplegando tu aplicación en Kubernetes..."

# Aplicar el deployment y servicio
kubectl apply -f mi-bienvenida.yaml
if [ $? -ne 0 ]; then
  echo "❌ Error al aplicar mi-bienvenida.yaml"
  exit 1
fi

# Aplicar el ingress
kubectl apply -f ingress.yaml
if [ $? -ne 0 ]; then
  echo "❌ Error al aplicar ingress.yaml"
  exit 1
fi

# Confirmación final
echo "✅ ¡Despliegue completado con éxito!"
echo "� Accede a tu aplicación en: http://bienvenida.local"
