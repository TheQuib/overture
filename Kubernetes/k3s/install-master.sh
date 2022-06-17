# Installs a k3s cluster with an embedded etcd database
# Make sure to set K3S_TOKEN to a super secret value 
curl -sfL https://get.k3s.io | K3S_TOKEN=YOURTOKENVALUE sh -s - server --cluster-init