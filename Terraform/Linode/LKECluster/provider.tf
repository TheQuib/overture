terraform {
    required_version = ">= 0.13"
    required_providers {

        linode = {
            source  = "linode/linode"
            version = "1.27.2"
        }

        #kubernetes {
        #    source = "hashicorp/kubernetes"
        #    version = "2.11.0"
        #}
    }
}

# Configure the Linode Provider
provider "linode" {
    token = var.linode_token
}

# Configure the Kubernetes Provider
provider "kubernetes" {
    config_path = base64decode(data.linode_lke_cluster.terraform_cluster_info.kubeconfig)
}