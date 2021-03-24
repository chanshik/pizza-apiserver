# create the namespace to run the apiserver in
kubectl create -f ns.yaml

# create the service account used to run the server
kubectl create -f sa.yaml -n pizza-apiserver

# create the rolebindings that allow the service account user to delegate authz back to the kubernetes master for incoming requests to the apiserver
kubectl create -f auth-delegator.yaml -n kube-system
kubectl create -f auth-reader.yaml -n kube-system

# create rbac roles and clusterrolebinding that allow the service account user to use admission webhooks
kubectl create -f rbac.yaml
kubectl create -f rbac-bind.yaml

# create the service and replication controller
kubectl create -f deployment.yaml -n pizza-apiserver
kubectl create -f service.yaml -n pizza-apiserver

# create the apiservice object that tells kubernetes about your api extension and where in the cluster the server is located
kubectl create -f v1alpha1-apiservice.yaml
kubectl create -f v1beta1-apiservice.yaml
