kubectl delete -f apiservice.yaml

kubectl delete -f deployment.yaml -n pizza-apiserver
kubectl delete -f service.yaml -n pizza-apiserver

kubectl delete -f rbac.yaml
kubectl delete -f rbac-bind.yaml

kubectl delete -f auth-delegator.yaml -n kube-system
kubectl delete -f auth-reader.yaml -n kube-system

kubectl delete -f sa.yaml -n pizza-apiserver

kubectl delete -f ns.yaml
