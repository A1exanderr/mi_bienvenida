#!/bin/bash

echo "í·‘ï¸  Eliminando tu aplicaciÃ³n de Kubernetes..."

kubectl delete -f ingress.yaml
kubectl delete -f mi-bienvenida.yaml

echo "âœ… Â¡AplicaciÃ³n eliminada!"
