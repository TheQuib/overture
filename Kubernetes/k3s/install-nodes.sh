# Installs k3s and joins to the cluster created on the 'master' node
# Make sure to set K3S_TOKEN to what you created for the cluster creation and the server flag to the hostname or IP of it
curl -sfL https://get.k3s.io | K3S_TOKEN=6KaKzdQcUvfmzQVJD6vhETAgyZp6 sh -s - --server https://<hostname or IP of first server>:6443