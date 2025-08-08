#=========================BACKENT==NO ES NECESARIO======================
kubectl autoscale deployment geoportal-back \
  --cpu-percent=70 \
  --min=2 \
  --max=5
#=======================================================
#===========================FRONT END== NO ES NECESARIO=================
kubectl autoscale deployment geoportal-frontend \
  --cpu-percent=60 \
  --min=2 \
  --max=4
#======================================================
kubectl apply -f geoportal-back-hpa.yaml
kubectl apply -f geoportal-frontend-hpa.yaml

kubectl get hpa


kubectl get deployment metrics-server -n kube-system

#PARA INSTALAR EL MANIFIESTO
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
#VERIFICAR
kubectl get deployment metrics-server -n kube-system
#Verifica que devuelve métricas
kubectl top nodes
kubectl top pods
kubectl get hpa
#si da error hay que aumetar una line
KUBE_EDITOR="nano" kubectl edit deployment metrics-server -n kube-system
#sta linea en la parte de args
#containers:
# image:
# args:
/*
--kubelet-insecure-tls
*/
#verificamos
kubectl get pods -n kube-system | grep metrics-server