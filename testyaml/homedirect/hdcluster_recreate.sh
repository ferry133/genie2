## Cluster
#k3d cluster delete hdcluster
#k3d cluster create hdcluster -s 3 -p "8081:80@loadbalancer" --agents 2
#k3d kubeconfig merge
# k3d kubeconfig merge hdcluster
# export KUBECONFIG="$(k3d kubeconfig write hdcluster)"

## Storage
k3s kubectl apply -f nfs-pv.yaml 
k3s kubectl get pv nfs-pv

k3s kubectl apply -f nfs-pvc.yaml 
k3s kubectl get pvc nfs-pvc

## Pods
k3s kubectl delete -f hd-pod.yaml 
k3s kubectl apply -f hd-pod.yaml 
k3s kubectl get pod
# k3s kubectl exec -it hdconfig-pod -- /bin/bash
# k3s kubectl exec -it hdrouter-pod -- /bin/bash
# k3s kubectl exec -it hdbroker-pod -- /bin/bash

#kubectl apply -f hdsvr-pod.yaml 
#kubectl get pod hdsvr-pod 
# kubectl exec --stdin --tty hdsvr-pod -c  broker-container -- /bin/bash
# kubectl exec --stdin --tty hdsvr-pod -c  router-container -- /bin/bash

## Services
k3s kubectl delete -f hd-svc.yaml
k3s kubectl apply -f hd-svc.yaml
k3s kubectl get svc 


## Ingress
k3s kubectl delete -f hd-ing.yaml
k3s kubectl apply -f hd-ing.yaml
k3s kubectl describe ing hd-ing 

