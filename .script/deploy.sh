#!/bin/bash

# Script de despliegue automÃ¡tico para tu app
echo "íº€ Desplegando tu aplicaciÃ³n en Kubernetes..."

# Aplicar el deployment y servicio
kubectl apply -f mi-bienvenida.yaml
if [ $? -ne 0 ]; then
  echo "âŒ Error al aplicar mi-bienvenida.yaml"
  exit 1
fi

# Aplicar el ingress
kubectl apply -f ingress.yaml
if [ $? -ne 0 ]; then
  echo "âŒ Error al aplicar ingress.yaml"
  exit 1
fi

# ConfirmaciÃ³n final
echo "âœ… Â¡Despliegue completado con Ã©xito!"
echo "í¼ Accede a tu aplicaciÃ³n en: http://bienvenida.local"
