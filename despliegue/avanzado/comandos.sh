# Elimina el Ingress
##==============================================================
kubectl delete ingress geoportal-ingress

# Elimina los servicios
kubectl delete service geortal-frontend-service
kubectl delete service geoportal-front-lb

# Elimina el deployment
kubectl delete deployment geortal-frontend-deployment
#Opción 2: Eliminar desde el archivo YAML directamente
kubectl delete -f geoportal.yaml
#VERIFICACION 
kubectl get all
kubectl get ingress
kubectl get svc
kubectl get deployments
#==============================================================